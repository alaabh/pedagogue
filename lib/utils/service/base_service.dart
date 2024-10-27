import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:pedagogue/constants/env.dart';
import 'package:pedagogue/model/base_model.dart';

import '../resources/api/api_response.dart';
import '../resources/api/api_service.dart';
import '../resources/api/custom_exception.dart';
import '../resources/api/paged_data.dart';

abstract class BaseService<Model extends BaseModel> {
  ApiResponse<Model> apiResponse = ApiResponse.loading();

  BaseService();

  get apiUrl => baseUrl;

  Function? get fromJsonFunction => null;

  Function(Model)? get toJsonFunction => null;

  CustomException toJsonFunctionUnassignedError() =>
      CustomException(message: "To json function unassigned");

  Future<ApiResponse<Model>> getAll() async {
    return await makeApiCall(
      fromJsonFunction: fromJsonFunction,
      apiCall: ApiService.instance.sendRequest(
        url: '$apiUrl/',
        httpMethod: HttpMethod.get,
      ),
    );
  }

  Future<ApiResponse<Model>> getById(int id) async {
    return await makeApiCall(
      fromJsonFunction: fromJsonFunction,
      apiCall: ApiService.instance.sendRequest(
        url: '$apiUrl/show/$id',
        httpMethod: HttpMethod.get,
      ),
    );
  }

  Future<ApiResponse<Model>> add(
    Model model, {
    List<String>? imagePathList,
    String? multipartParamName,
  }) async {
    if (toJsonFunction == null) throw toJsonFunctionUnassignedError();

    return await makeApiCall(
      fromJsonFunction: fromJsonFunction,
      apiCall: imagePathList == null
          ? ApiService.instance.sendRequest(
              url: '$apiUrl/create',
              httpMethod: HttpMethod.post,
              body: toJsonFunction!(model),
            )
          : ApiService.instance.sendMultipartRequest(
              url: '$apiUrl/create',
              httpMethod: HttpMethod.post,
              body: toJsonFunction!(model),
              multipartParamName: multipartParamName,
              filesPathList: imagePathList,
            ),
    );
  }

  Future<ApiResponse<Model>> update(
    Model model, {
    List<String>? imagePathList,
    String? multipartParamName,
  }) async {
    if (toJsonFunction == null) throw toJsonFunctionUnassignedError();

    final apiResponse = await makeApiCall(
      fromJsonFunction: fromJsonFunction,
      apiCall: imagePathList == null
          ? ApiService.instance.sendRequest(
              url: '$apiUrl/edit/${model.id ?? 0}',
              httpMethod: HttpMethod.post,
              body: toJsonFunction!(model),
            )
          : ApiService.instance.sendMultipartRequest(
              url: '$apiUrl/edit/${model.id ?? 0}',
              httpMethod: HttpMethod.post,
              body: toJsonFunction!(model),
              multipartParamName: multipartParamName,
              filesPathList: imagePathList,
            ),
    );

    apiResponse.item = model;

    return apiResponse;
  }

  Future<ApiResponse<Model>> delete(int id) async {
    final apiResponse = await makeApiCall(
      fromJsonFunction: fromJsonFunction,
      apiCall: ApiService.instance.sendRequest(
        url: '$apiUrl/destroy/$id',
        httpMethod: HttpMethod.delete,
      ),
    );

    return apiResponse;
  }

  void setApiResponseData(
    dynamic data,
    Function? fromJson, {
    bool hasCustomData = false,
  }) {
    if (hasCustomData) {
      apiResponse.customData = data;
      return;
    }

    if (data is List) {
      if (data.isNotEmpty && fromJson != null) {
        apiResponse.itemList = data.map<Model>((e) => fromJson(e)).toList();
      }
    } else if (data is Map) {
      if (fromJson != null) apiResponse.item = fromJson(data);
    } else if (data.runtimeType is PagedData) {
      apiResponse.pagedData = data as PagedData<Model>;
    } else if (data is String) {
      apiResponse.message = data;
    } else {
      apiResponse.customData = data;
      log('Unsupported api response type ${data.runtimeType}');
      log("Custom data : $data");
    }
  }

  Future<ApiResponse<Model>> makeApiCall({
    required Future<dynamic> apiCall,
    Function? fromJsonFunction,
    bool withoutLoading = false,
    bool hasCustomData = false,
  }) async {
    if (!withoutLoading) apiResponse = ApiResponse.loading();

    try {
      apiResponse = ApiResponse.completed();
      setApiResponseData(
        await apiCall,
        fromJsonFunction,
        hasCustomData: hasCustomData,
      );
    } catch (e, stackTrace) {
      int? statusCode;
      if (e.runtimeType == CustomException) {
        statusCode = (e as CustomException).statusCode;
      }

      log('Network error : $e');
      if (kDebugMode) print(stackTrace);
      apiResponse = ApiResponse.error(
        message: e.toString(),
        statusCode: statusCode,
      );
    }

    return apiResponse;
  }
}
