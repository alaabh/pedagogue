import 'package:pedagogue/model/user.dart';

class LoginResponse {
  String? token;
  User? user;

  LoginResponse({this.token, this.user});
}
