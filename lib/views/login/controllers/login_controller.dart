import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/default_response_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';

class LoginController extends GetxController {
  TextEditingController nickController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  UserModel user = UserModel();

  String? userNameValidator(String? value) {
    if (value == null || value.length <= 8) {
      return '8 karakterden küçük olamaz';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.length <= 8) {
      return '8 karakterden küçük olamaz';
    }
    return null;
  }

  Future<void> loginOnPressed() async {
    user.nickname = nickController.text;
    user.password = passwordController.text;
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();

      final DefaultResponseModel<UserModel> response =
          await UserRepository().login(user);

      user = response.data!;
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('key', user.key!);

      if (!response.responseIsTrue!) {
        Get.showSnackbar(GetSnackBar(message: response.message));
      } else {
        Get.toNamed<void>('/task_page');
      }
    }
  }
}
