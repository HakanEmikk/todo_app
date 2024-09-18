import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/user_model.dart';

class RegisterController extends GetxController {
  late UserModel userModel;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'isim  boş olamaz';
    }
    return null;
  }

  // ignore: use_setters_to_change_properties
  void nameOnChanged(String? value) {
    userModel.name = value;
  }

  String? surnameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'soyisim  boş olamaz';
    }
    return null;
  }

  // ignore: use_setters_to_change_properties
  void surnameOnChanged(String? value) {
    userModel.surname = value;
  }

  String? nicknameValidator(String? value) {
    if (value == null || value.length <= 8) {
      return '8 karakterden küçük olamaz';
    }
    return null;
  }

  // ignore: use_setters_to_change_properties
  void nicknameOnChanged(String? value) {
    userModel.nickname = value;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.length <= 8) {
      return '8 karakterden küçük olamaz';
    }
    return null;
  }

  // ignore: use_setters_to_change_properties
  void passwordOnChanged(String? value) {
    userModel.password = value;
  }

  String? mailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'boş olamaz ';
    }
    return null;
  }

  void mailOnChanged(String? value) {
    // ignore: unnecessary_statements
    userModel.mail;
  }

  void registerOnPressed() {
    if (registerFormKey.currentState!.validate()) {
      return registerFormKey.currentState!.save();
    }
  }

  Future<UserModel> createUser() async {
    throw UnimplementedError();
  }
}
