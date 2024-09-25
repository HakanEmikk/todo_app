import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/default_response_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'isim  boş olamaz';
    }
    return null;
  }

  String? surnameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'soyisim  boş olamaz';
    }
    return null;
  }

  String? nicknameValidator(String? value) {
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

  String? mailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'boş olamaz ';
    }
    return null;
  }

  Future<void> registerOnPressed() async {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      final UserModel user = UserModel();
      user.mail = mailController.text;
      user.name = nameController.text;
      user.nickname = nicknameController.text;
      user.password = passwordController.text;
      user.surname = surnameController.text;
      final DefaultResponseModel<void> response =
          await UserRepository().register(user);

      Get.showSnackbar(GetSnackBar(
        message: response.message,
      ));
    }
  }
}
