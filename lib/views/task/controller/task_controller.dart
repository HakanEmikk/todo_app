import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../models/default_response_model.dart';
import '../../../models/task_model.dart';
import '../../../repositories/task_repository.dart';
import '../../login/controllers/login_controller.dart';

class TaskController extends GetxController {
  RxBool isLoading = false.obs;

  int? index;
  RxList<TaskModel> taskList = <TaskModel>[].obs;
  TaskModel task = TaskModel();
  TextEditingController explanationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormState> formKeyUpdate = GlobalKey();
  LoginController loginController = Get.put(LoginController());
  Future<void> fetchTaskList() async {
    isLoading.value = true;
    final DefaultResponseModel<List<TaskModel>> response =
        await TaskRepository().listing();

    if (response.data != null && response.data!.isNotEmpty) {
      taskList = response.data!.obs;
    } else {
      taskList = <RxList<TaskModel>>[].obs as RxList<TaskModel>;
    }

    isLoading.value = false;
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
      task.fileId = 1;

      final DefaultResponseModel<void> response =
          await TaskRepository().add(task);
      fetchTaskList();
      Get.showSnackbar(GetSnackBar(
        message: response.message,
      ));
    }
  }

  void profileUpdateOnPressed() {
    Get.toNamed<void>('/profil_info_page');
  }

  void taskUpdateOnPressed() async {
    if (formKeyUpdate.currentState!.validate()) {
      formKeyUpdate.currentState!.save();

      taskList[index!].category = categoryController.text;
      taskList[index!].explation = explanationController.text;

      final DefaultResponseModel<void> response =
          await TaskRepository().update(taskList[index!]);
      fetchTaskList();
    }
  }

  void checkOnPressed(bool? value) {
    print(taskList[index!].status);
    taskList[index!].status = value.toString();
    print(taskList[index!].status);
  }

  void updatePageNavigator(int updateIndex) {
    index = updateIndex;
    Get.toNamed<void>('/task_update_page');
  }

  void taskDeleteOnPressed(int index) async {
    final DefaultResponseModel<void> response =
        await TaskRepository().delete(taskList[index]);
    taskList.removeAt(index);
  }
}
