import 'package:flutter_api/Core/Api/end_points.dart';

class SignInModel {
  final String message;
  final String token;

  SignInModel({required this.message, required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
        message: jsonData[ApiKeys.message], token: jsonData[ApiKeys.token]);
  }
}
