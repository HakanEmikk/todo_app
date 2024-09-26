import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/default_response_model.dart';
import '../../../models/task_model.dart';
import '../../../repositories/task_repository.dart';

class TaskController extends GetxController {
  RxBool isLoading = false.obs;
  List<TaskModel> taskList = <TaskModel>[];
  TaskModel task = TaskModel();
  TextEditingController explanationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  Future<void> fetchTaskList() async {
    final DefaultResponseModel<List<TaskModel>> response =
        await TaskRepository().listing();

    taskList = response.data!;
    if (!response.responseIsTrue!) {
      Get.showSnackbar(GetSnackBar(message: response.message));
    } else {
      isLoading = false.obs;
    }
  }

  void taskAddOnPressed() {
    Get.toNamed(
      '/task_add_page',
    );
  }

  Future<void> addOnPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      task.category = categoryController.text;
      task.explanation = explanationController.text;

      final DefaultResponseModel<void> response =
          await TaskRepository().add(task);
      Get.showSnackbar(GetSnackBar(
        message: response.message,
      ));
    }
  }
}
