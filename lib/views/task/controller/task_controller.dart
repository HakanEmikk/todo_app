import 'dart:async';
import 'dart:convert';

import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../models/category_model.dart';
import '../../../models/default_response_model.dart';
import '../../../models/file_model.dart';
import '../../../models/task_model.dart';
import '../../../repositories/category_repository.dart';
import '../../../repositories/task_repository.dart';
import '../../login/controllers/login_controller.dart';

class TaskController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<FileModel> selectedFiles = <FileModel>[].obs;
  String? fileName;
  int? index;
  var data;
  RxList<TaskModel> taskList = <TaskModel>[].obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  TaskModel task = TaskModel();
  FileModel file = FileModel();
  TextEditingController explanationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormState> formKeyUpdate = GlobalKey();
  LoginController loginController = Get.put(LoginController());
  RxString? selectedCategory = ''.obs;
  onInit() {
    super.onInit();

    fetchCategoryList();
  }

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

  Future<void> fetchCategoryList() async {
    final DefaultResponseModel<List<CategoryModel>> response =
        await CategoryRepository().get();

    if (response.data != null && response.data!.isNotEmpty) {
      categoryList.value = response.data!;
    } else {
      categoryList.value =
          <RxList<CategoryModel>>[].obs as RxList<CategoryModel>;
    }
  }

  void taskAddOnPressed() {
    Get.toNamed<void>(
      '/task_add_page',
    );
  }

  Future<void> addOnPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      task.userId = loginController.user.value.id;

      task.explation = explanationController.text;
      task.status = 'false';
      task.categoryId = int.parse(selectedCategory!.value!);

      final DefaultResponseModel<void> response =
          await TaskRepository().add(task);
      fetchTaskList();
      Get.back<void>();
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
      taskList[index!].categoryId = int.parse(selectedCategory!.value);

      final DefaultResponseModel<void> response =
          await TaskRepository().update(taskList[index!]);
      fetchTaskList();
      Get.back<void>();
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

  Future<void> pickMultipleFiles(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );
    if (result != null) {
      final Uint8List? data = result.files.single.bytes;
      final html.Blob blob = html.Blob(
        [data],
      );
      fileName = result.files.single.name;
      html.File([blob], fileName!);
    } else {
      print('Dosya seçilmedi');
    }

    final html.FileReader reader = html.FileReader();

    reader.onLoadEnd.listen((event) async {
      if (reader.readyState == html.FileReader.DONE) {
        String task_id = taskList[index].id.toString();
        try {
          final Uri uri = Uri.parse("http://192.168.1.235:3000/files/$task_id");
          late http.MultipartRequest request;
          request = http.MultipartRequest('POST', uri);

          final Uint8List byteData = reader.result! as Uint8List;
          http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
            'files',
            byteData,
            filename: fileName,
            contentType: MediaType('application', 'octet-stream'),
          );
          file.fileName = fileName;
          file.taskId = taskList[index].id;
          request.fields['data'] = jsonEncode(file);
          request.files.add(multipartFile);
          request.headers.addAll(<String, String>{
            HttpHeaders.authorizationHeader:
                'Bearer ${loginController.user.value.key}',
          });
          request.send();
        } catch (e) {
          print('hataa$e');
        }
      }
    });
  }

  void categoryAddOnPressed() {
    Get.toNamed<void>('/category_add_page');
  }
}
