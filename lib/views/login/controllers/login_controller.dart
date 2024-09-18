import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/user_model.dart';

class LoginController extends GetxController {
  UserModel userModel = UserModel();
  final loginFormKey = GlobalKey<FormState>();

  String? userNameValidator(String? value) {
    if (value == null || value.length <= 8) return "8 karakterden küçük olamaz";
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.length <= 8) return "8 karakterden küçük olamaz";
    return null;
  }

  void userNameOnChanged(String? value) {
    userModel.nickname = value;
  }

  void passwordOnChanged(String? value) {
    userModel.password = value;
  }

  void loginOnPressed() {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
    }
  }
}
