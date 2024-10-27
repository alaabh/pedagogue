import 'dart:convert';
import 'dart:developer';

import 'package:pedagogue/utils/resources/api/token_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../../model/user.dart';
import '../../service/user_service.dart';
import 'api_response.dart';

class UserSession {
  static UserSession? _instance;

  UserSession._();

  static UserSession get instance => _instance ??= UserSession._();

  bool loggingIsActive = false;

  static const String userSessionKey = 'USER_SESSION';

  static User? _currentUser;

  static User get currentUser => _currentUser!;

  // Check session exist
  bool checkSessionExist() {
    if (loggingIsActive) log('checkSessionExist - checking user');
    return _currentUser != null;
  }

  // Saves a new user session
  Future<void> saveUserSession(User user) async {
    if (loggingIsActive) log('saveUserSession - saving session');
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(userSessionKey, jsonEncode(user.toJson()));
    _currentUser = user;

    if (loggingIsActive) {
      log('saveUserSession - saved session with id : ${_currentUser?.id}');
    }
  }

  // load the current user session into the variable userSession
  Future<void> loadUserSession() async {
    if (loggingIsActive) log('loadUserSession - Loading session');
    if (_currentUser == null) {
      if (loggingIsActive) {
        log('loadUserSession - CurrentUser is null .. loading from shared prefs');
      }

      final sharedPreferences = await SharedPreferences.getInstance();
      final userSession = sharedPreferences.getString(userSessionKey);
      if (userSession != null && userSession.isNotEmpty) {
        if (loggingIsActive) {
          log('loadUserSession - userSession is not null .. saving to _currentUser');
        }

        _currentUser = User.fromJson(jsonDecode(userSession));
      }
    }
    if (loggingIsActive) {
      log('loadUserSession - loaded session with id : ${_currentUser?.id}');
    }
  }

  // Reset user session
  Future<void> resetUserSession() async {
    if (loggingIsActive) log('resetUserSession - Resetting session');
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(userSessionKey, '');
    _currentUser = null;
    await TokenManager.resetToken();
  }

  // Refresh the userSession from the server
  Future<void> refreshUserSession(UserService userService) async {
    if (loggingIsActive) log('refreshUserSession - Refreshing session');

    if (_currentUser?.id != null) {
      await userService.getByToken().then((apiResponse) async {
        if (apiResponse.status == ApiStatus.completed &&
            apiResponse.item != null) {
          await saveUserSession(apiResponse.item!);
        }
      });
    } else {
      if (loggingIsActive) log('Failed to load user resetting user session');
      await resetUserSession();
      main();
    }
  }
}
