import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:pedagogue/feature/web_view/web_view.dart';
import 'package:pedagogue/main.dart';
import 'package:pedagogue/utils/resources/api/token_manager.dart';

import 'custom_exception.dart';

enum HttpMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  final String description;

  const HttpMethod(this.description);
}

class ApiService {
  bool loggingIsActive = true;
  bool webResponseActive = false;

  static final ApiService instance = ApiService._internal();

  factory ApiService() {
    return instance;
  }

  ApiService._internal();

  Future<dynamic> sendRequest({
    required HttpMethod httpMethod,
    required String url,
    bool authIsRequired = true,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    List<dynamic>? listBody,
    Map<String, String?>? queryParameters,
    String? bodyItemName,
    bool willStoreToken = false,
  }) async {
    try {
      headers ??= {};
      headers.addAll({'Content-Type': 'application/json; charset=utf-8'});
      if (authIsRequired) {
        await TokenManager.loadToken();
        headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
      }

      late http.Response response;
      const timeout = Duration(seconds: 30);

      final Uri uri = Uri.parse(url).replace(
        queryParameters: queryParameters
          ?..removeWhere((key, value) => value == null),
      );

      switch (httpMethod) {
        case HttpMethod.get:
          response = await http.get(uri, headers: headers).timeout(timeout);
          break;
        case HttpMethod.post:
          response = await http
              .post(uri, headers: headers, body: jsonEncode(body ?? listBody))
              .timeout(timeout);
          break;
        case HttpMethod.put:
          response = await http
              .put(uri, headers: headers, body: jsonEncode(body ?? listBody))
              .timeout(timeout);
          break;
        case HttpMethod.delete:
          response = await http.delete(uri, headers: headers).timeout(timeout);
          break;
      }

      if (loggingIsActive) {
        log('${httpMethod.description} ${response.statusCode} : $uri');
      }

      switch (response.statusCode) {
        case 200:
        case 201:
        case 202:
        case 203:
          try {
            final body = jsonDecode(utf8.decode(response.bodyBytes))
                as Map<String, dynamic>;

            if (willStoreToken) {
              await TokenManager.saveToken(body['token']);
            }

            if (bodyItemName != null) {
              return body[bodyItemName];
            } else {
              if (body.containsKey('data') && body.keys.length == 1) {
                return body['data'];
              }
            }

            return body;
          } catch (e, stackTrace) {
            if (kDebugMode) print(stackTrace);
            if (kDebugMode) print(response.body);

            try {
              return jsonDecode(response.body);
            } catch (e, stackTrace) {
              if (kDebugMode) print(stackTrace);
              if (kDebugMode) print(response.body);
            }
          }

          return {};
        case 204:
          return {};
        default:
          handleHttpError(
            response.body,
            response.statusCode,
          );
          break;
      }
    } on TimeoutException {
      log('Timeout exceeded URL : $url');
      throw CustomException.networkTimeout();
    } on SocketException {
      log('No Internet Connection URL : $url');
      throw CustomException.networkError();
    }
  }

  Future<dynamic> sendMultipartRequest({
    required HttpMethod httpMethod,
    required String url,
    bool authIsRequired = true,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, String?>? queryParameters,
    String? multipartParamName,
    List<String> filesPathList = const [],
  }) async {
    try {
      late http.MultipartRequest request;

      final Uri uri = Uri.parse(url).replace(
        queryParameters: queryParameters
          ?..removeWhere((key, value) => value == null),
      );

      switch (httpMethod) {
        case HttpMethod.post:
          request = http.MultipartRequest('POST', uri);
          break;
        case HttpMethod.put:
          request = http.MultipartRequest('PUT', uri);
          break;
        default:
          throw UnsupportedError('Unsupported method : $httpMethod');
      }

      headers ??= {};
      headers.addAll({'Content-Type': 'application/json; charset=utf-8'});

      if (authIsRequired) {
        await TokenManager.loadToken();
        headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
      }
      request.headers.addAll(headers);

      if (body != null) {
        body.forEach((key, value) {
          if (value != null) request.fields.addAll({key: value.toString()});
        });
      }

      for (String filePath in filesPathList) {
        String? mimeType = lookupMimeType(filePath);
        MediaType? mediaType;

        if (mimeType == null) {
          throw CustomException(message: 'File type null');
        }

        if (mimeType == 'image/png') {
          mediaType = MediaType('image', 'png');
        } else if (mimeType == 'image/jpeg') {
          mediaType = MediaType('image', 'jpeg');
        } else if (mimeType == 'video/mp4') {
          mediaType = MediaType('video', 'mp4');
        } else if (mimeType == 'video/quicktime') {
          mediaType = MediaType('video', 'mp4');
        } else {
          throw CustomException(
            message: 'This video or image type is not supported'
                '$mimeType',
          );
        }

        request.files.add(
          await http.MultipartFile.fromPath(
            multipartParamName ?? '',
            filePath,
            contentType: mediaType,
          ),
        );
      }

      http.StreamedResponse response = await request.send();

      if (loggingIsActive) {
        log('MULTIPART - ${httpMethod.description} ${response.statusCode} : $uri');
      }

      switch (response.statusCode) {
        case 200:
        case 201:
        case 202:
        case 203:
          try {
            final body = jsonDecode(await response.stream.bytesToString())
                as Map<String, dynamic>;

            if (body.containsKey('data') && body.keys.length == 1) {
              return body['data'];
            }

            return body;
          } catch (e, stackTrace) {
            if (kDebugMode) print(stackTrace);
          }

          return {};
        case 204:
          return jsonDecode('{}');
        default:
          String? body;

          if (kDebugMode) {
            body = await response.stream.bytesToString();
          }

          handleHttpError(
            body,
            response.statusCode,
          );
          break;
      }
    } on TimeoutException {
      log('Timeout exceeded URL : $url');
      throw CustomException.networkTimeout();
    } on SocketException {
      log('No Internet Connection URL : $url');
      throw CustomException.networkError();
    }
  }

  void handleHttpError(String? body, int statusCode) {
    String? message;

    if (body != null) {
      try {
        final jsonBody = jsonDecode(body) as Map<String, dynamic>;
        if (jsonBody.containsKey('message')) {
          message = jsonBody['message'];
        } else if (jsonBody.containsKey('error')) {
          message = jsonBody['error'];
        } else if (jsonBody.containsKey('errors')) {
          message = jsonBody['errors'].values.toList().toString();
        } else if (jsonBody.containsKey('msg')) {
          message = jsonBody['msg'];
        } else if (jsonBody.containsKey('err')) {
          message = jsonBody['err'];
        }
      } catch (e, stackTrace) {
        if (kDebugMode) {
          print(body);
          print(e);
          print(stackTrace);
        }
      }
    }

    if (message == null) if (kDebugMode) print(body);

    if (kDebugMode &&
        webResponseActive &&
        body != null &&
        body.contains('<!DOCTYPE html>')) {
      Navigator.of(mainNavigatorKey.currentContext!).push(
        MaterialPageRoute(
          builder: (context) => WebView(
            isDanger: true,
            title: 'HTTP error - code $statusCode',
            htmlString: body,
          ),
        ),
      );
    }

    throw CustomException(
      message: message ?? 'HTTP error - code : $statusCode',
      statusCode: statusCode,
    );
  }
}
