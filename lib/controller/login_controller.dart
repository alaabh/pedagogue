import 'package:flutter/foundation.dart';
import 'package:pedagogue/utils/resources/api/api_response.dart';
import '../../utils/service/auth_service.dart';
import '../l10n/localization.dart';
import '../model/user.dart';
import '../utils/resources/api/token_manager.dart';
import '../utils/resources/api/user_session.dart';

class LoginController {
  final LoginService _loginService = LoginService();
  Function(String)? onSuccess;
  Function(String)? onError;

  LoginController({this.onSuccess, this.onError});

  Future<ApiResponse<User>> login(
    String email,
    String password,
  ) async {
    try {
      var loginResponse = await _loginService.login(email, password);

      if (loginResponse?.user != null && loginResponse?.token != null) {
        // Successful login
        await TokenManager.saveToken(loginResponse!.token!);
        await UserSession.instance.saveUserSession(loginResponse.user!);

        onSuccess?.call(loginResponse.token!);

        return ApiResponse.completed(item: loginResponse.user);
      } else {
        // Login failed, no token received
        onError?.call('Login failed: Invalid credentials or server error.');

        return ApiResponse.error(message: intl.invalidCredentials);
      }
    } catch (e, stackTrace) {
      if (kDebugMode) print(stackTrace);
      onError?.call('Error during login: $e');
    }

    return ApiResponse.error();
  }
}
