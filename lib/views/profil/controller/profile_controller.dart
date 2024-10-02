import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/default_response_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';
import '../../login/controllers/login_controller.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  LoginController controller = Get.put(LoginController());

  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
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

  String? mailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'boş olamaz ';
    }
    return null;
  }

  void updateOnPressed() async {
    if (updateFormKey.currentState!.validate()) {
      updateFormKey.currentState!.save();

      print(controller.user.id);
      controller.user.mail = mailController.text;
      controller.user.name = nameController.text;
      controller.user.nickname = nicknameController.text;
      controller.user.password = passwordController.text;
      controller.user.surname = surnameController.text;
      final DefaultResponseModel<UserModel> response =
          await UserRepository().update(controller.user);
      controller.user = response.data!;

      Get.showSnackbar(GetSnackBar(
        message: response.message,
      ));
    }
  }

  void profileInfoUpdateOnPressed() {
    Get.toNamed<void>('/profil_update_page');
  }
}
