import 'package:pedagogue/model/base_model.dart';

class RegisterModel extends BaseModel {
  String fullName;
  String email;
  String password;
  String passwordConfirmation;
  String subscriptionPrice;

  RegisterModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.subscriptionPrice,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    return {
      'name': fullName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
