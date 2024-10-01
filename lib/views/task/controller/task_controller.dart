import 'dart:async';
import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../models/default_response_model.dart';
import '../../../models/file_model.dart';
import '../../../models/task_model.dart';
import '../../../repositories/task_repository.dart';
import '../../login/controllers/login_controller.dart';

class TaskController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<FileModel> selectedFiles = <FileModel>[].obs;
  String? fileName;
  int? index;
  var data;
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
      print(categoryController.text.isEmpty);
      if (explanationController.text.isEmpty) {
        taskList[index!].explation = taskList[index!].explation;
      } else {
        taskList[index!].explation = explanationController.text;
      }

      if (categoryController.text.isEmpty) {
        taskList[index!].category = taskList[index!].category;
      } else {
        taskList[index!].category = categoryController.text;
      }

      final DefaultResponseModel<void> response =
          await TaskRepository().update(taskList[index!]);
      fetchTaskList();
    }
  }

  // void checkOnPressed(bool? value) {
  //   print(taskList[index!].status);
  //   taskList[index!].status = value.toString();
  //   print(taskList[index!].status);
  // }

  void updatePageNavigator(int updateIndex) {
    index = updateIndex;
    Get.toNamed<void>('/task_update_page');
  }

  void taskDeleteOnPressed(int index) async {
    final DefaultResponseModel<void> response =
        await TaskRepository().delete(taskList[index]);
    taskList.removeAt(index);
  }

  Future<void> pickMultipleFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );
    if (result != null) {
      final data = result.files.single.bytes;
      final blob = html.Blob([data]);
      fileName = result.files.single.name;
      html.File([blob], fileName!);
    } else {
      print('Dosya seçilmedi');
    }

    final reader = html.FileReader();

    reader.onLoadEnd.listen((event) async {
      if (reader.readyState == html.FileReader.DONE) {
        final uri = Uri.parse(uri);
        late http.MultipartRequest request;
        request = http.MultipartRequest('POST', uri);
      }
      final Uint8List byteData = reader.result! as Uint8List;
      var multipartFile = http.MultipartFile.fromBytes(
        'file',
        byteData,
        filename: fileName,
        contentType: MediaType('application', 'octet-stream'),
      );
    });
  }
}
