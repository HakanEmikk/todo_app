import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/default_response_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';

class LoginController extends GetxController {
  TextEditingController nickController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  Rx<UserModel> user = UserModel().obs;

  String? userNameValidator(String? value) {
    if (value == null || value.length < 8) {
      return '8 karakterden küçük olamaz';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.length < 8) {
      return '8 karakterden küçük olamaz';
    }
    return null;
  }

  Future<void> loginOnPressed() async {
    user.value.nickname = nickController.text;
    user.value.password = passwordController.text;
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();

      final DefaultResponseModel<Rx<UserModel>> response =
          await UserRepository().login(user.value.obs);

      user = response.data!;
      user.value.key = response.token!;
      print('hhhhhh${user.toJson()}');
      Get.toNamed<void>('/task_page');
    }
  }
}
