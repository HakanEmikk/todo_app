import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/category_model.dart';
import '../../models/default_response_model.dart';
import '../../repositories/category_repository.dart';
import '../../views/task/controller/task_controller.dart';

class CategoryController extends GetxController {
  TextEditingController categoryNameController = TextEditingController();
  final GlobalKey<FormState> categoryKey = GlobalKey();
  TaskController controller = Get.put(TaskController());
  CategoryModel category = CategoryModel();
  Future<void> categoryAddOnPressed() async {
    if (categoryKey.currentState!.validate()) {
      categoryKey.currentState!.save();
      category.catergoryName = categoryNameController.text;
      print(category.catergoryName);
      final DefaultResponseModel<void> response =
          await CategoryRepository().add(category);
      controller.fetchCategoryList();
      Get.showSnackbar(GetSnackBar(
        message: response.message,
      ));
    }
  }

  String? categoryNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'boş olamaz ';
    }
    return null;
  }
}
