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

  Future<void> updateOnPressed() async {
    if (updateFormKey.currentState!.validate()) {
      updateFormKey.currentState!.save();

      controller.user.update((UserModel? user) {
        user!.mail = mailController.text;
        user.name = nameController.text;
        user.nickname = nicknameController.text;
        user.password = passwordController.text;
        user.surname = surnameController.text;
      });
      final DefaultResponseModel<Rx<UserModel>> response =
          await UserRepository().update(controller.user);
      controller.user.value = response.data!.value;
      Get.back<void>();
      Get.showSnackbar(GetSnackBar(
        message: response.message,
      ));
    }
  }

  void profileInfoUpdateOnPressed() {
    Get.toNamed<void>('/profil_update_page');
  }
}
