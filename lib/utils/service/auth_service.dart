import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pedagogue/model/login_response.dart';

import '../../constants/env.dart';
import '../../model/RegisterModel.dart';
import '../../model/user.dart';
import '../resources/api/api_response.dart';
import '../resources/api/api_service.dart';
import 'base_service.dart';

class AuthService extends BaseService<RegisterModel> {
  AuthService._();

  static final AuthService instance = AuthService._();

  factory AuthService() => instance;

  Future<ApiResponse<RegisterModel>> register(
    RegisterModel registerModel,
  ) async {
    return await makeApiCall(
      apiCall: ApiService.instance.sendRequest(
        url: '$baseUrl/register/${registerModel.subscriptionPrice}',
        httpMethod: HttpMethod.post,
        body: registerModel.toJson(),
        authIsRequired: false,
      ),
      hasCustomData: true,
    );
  }

  Future<ApiResponse> forgotPassword({required String email}) async {
    return await makeApiCall(
      apiCall: ApiService.instance.sendRequest(
        url: '$baseUrl/forgot',
        httpMethod: HttpMethod.post,
        body: {'email': email},
        authIsRequired: false,
      ),
    );
  }
}

class LoginService {
  Future<LoginResponse?> login(String email, String password) async {
    var url = Uri.parse('$baseUrl/login');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;

      if (data['data'] != null) {
        if (data['data'].toString().toLowerCase() ==
            'email ou mot de passe incorrect') {
          return null;
        }
      }

      return LoginResponse(user: User.fromJson(data), token: '');
    } else {
      // Handle the error
      if (kDebugMode) {
        print('Login Failed: ${response.body}');
        print('Response body: ${response.body}');
      }

      return null;
    }
  }
}
