import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../models/default_response_model.dart';
import '../../../models/task_model.dart';
import '../../../repositories/task_repository.dart';
import '../../login/controllers/login_controller.dart';

class TaskController extends GetxController {
  RxBool isLoading = true.obs;
  List<TaskModel> taskList = <TaskModel>[];
  TaskModel task = TaskModel();
  TextEditingController explanationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  LoginController loginController = Get.put(LoginController());
  Future<void> fetchTaskList() async {
    final DefaultResponseModel<List<TaskModel>> response =
        await TaskRepository().listing();

    taskList = response.data!;

    isLoading = false.obs;
  }

  void taskAddOnPressed() {
    Get.toNamed(
      '/task_add_page',
    );
  }

  Future<void> addOnPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      task.userId = loginController.user.id;
      task.category = categoryController.text;
      task.explation = explanationController.text;
      task.status = 'false';

      final DefaultResponseModel<void> response =
          await TaskRepository().add(task);
      Get.showSnackbar(GetSnackBar(
        message: response.message,
      ));
    }
  }

  void profileUpdateOnPressed() {
    Get.toNamed<void>('/profil_info_page');
  }
}
