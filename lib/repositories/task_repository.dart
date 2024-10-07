import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../abstracts/i_task_repository.dart';
import '../models/default_response_model.dart';
import '../models/task_model.dart';
import '../utils/constants.dart';
import '../views/login/controllers/login_controller.dart';

class TaskRepository extends ITaskRepository {
  LoginController controller = Get.put(LoginController());
  @override
  Future<DefaultResponseModel<void>> add(TaskModel task) async {
    try {
      final http.Response response = await http.post(
          Uri(
              host: AppConstants.API_URL,
              port: AppConstants.API_PORT,
              path: 'tasks'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
            HttpHeaders.authorizationHeader:
                'Bearer ${controller.user.value.key!}',
          },
          body: jsonEncode({'data': task}));

      return DefaultResponseModel<void>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      return DefaultResponseModel<void>(message: 'Bir hata oluştu! URR : $e');
    }
  }

  @override
  // ignore: strict_raw_type, always_specify_types
  Future<DefaultResponseModel> delete(TaskModel task) async {
    try {
      final http.Response response = await http.delete(
          Uri(
            host: AppConstants.API_URL,
            port: AppConstants.API_PORT,
            path: 'tasks/${task.id}',
          ),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
            HttpHeaders.authorizationHeader:
                'Bearer ${controller.user.value.key!}',
          },
          body: jsonEncode({'data': task}));
      return DefaultResponseModel<void>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      return DefaultResponseModel<void>(message: 'Bir hata oluştu! URR : $e');
    }
  }

  @override
  Future<DefaultResponseModel<List<TaskModel>>> listing() async {
    try {
      final http.Response response = await http.get(
        Uri(
            host: AppConstants.API_URL,
            port: AppConstants.API_PORT,
            path: 'tasks/get/${controller.user.value.id}'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader:
              'Bearer ${controller.user.value.key!}',
        },
      );

      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic>? datalist = data['datalist'] as List<dynamic>?;
      if (datalist == null) {
        throw Exception('Datalist is null');
      }

      return DefaultResponseModel<List<TaskModel>>(
        message: data['message'] as String,
        data: datalist.map((task) {
          // `task` verilerinin her bir öğesi `Map<String, dynamic>` olmalı
          if (task is Map<String, dynamic>) {
            return TaskModel.fromJson(task);
          } else {
            throw Exception('Unexpected data format in task');
          }
        }).toList(),
      );
    } catch (e) {
      return DefaultResponseModel<List<TaskModel>>(
          message: 'Bir hata oluştu! TRR : $e', data: <TaskModel>[]);
    }
  }

  @override
  // ignore: strict_raw_type, always_specify_types
  Future<DefaultResponseModel> update(TaskModel task) async {
    try {
      final http.Response response = await http.put(
          Uri(
            host: AppConstants.API_URL,
            port: AppConstants.API_PORT,
            path: 'tasks/${task.id}',
          ),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
            HttpHeaders.authorizationHeader:
                'Bearer ${controller.user.value.key!}',
          },
          body: jsonEncode({'data': task}));
      return DefaultResponseModel<void>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      return DefaultResponseModel<void>(message: 'Bir hata oluştu! URR : $e');
    }
  }
}
