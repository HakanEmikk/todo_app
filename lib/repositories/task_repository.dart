import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../abstracts/i_task_repository.dart';
import '../models/default_response_model.dart';
import '../models/task_model.dart';
import '../utils/constants.dart';

class TaskRepository extends ITaskRepository {
  @override
  Future<DefaultResponseModel<void>> add(TaskModel task) async {
    try {
      final http.Response response =
          await http.post(Uri(host: AppConstants.API_URL, path: 'tasks'),
              headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=UTF-8',
              },
              body: jsonEncode({'data': task}));

      return DefaultResponseModel<void>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      return DefaultResponseModel<void>(
          responseIsTrue: false, message: 'Bir hata oluştu! URR : $e}');
    }
  }

  @override
  // ignore: strict_raw_type, always_specify_types
  Future<DefaultResponseModel> delete(TaskModel task) async {
    try {
      final http.Response response =
          await http.delete(Uri(host: AppConstants.API_URL, path: 'tasks'));
      return DefaultResponseModel<void>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      return DefaultResponseModel<void>(
          responseIsTrue: false, message: 'Bir hata oluştu! URR : $e}');
    }
  }

  @override
  Future<DefaultResponseModel<List<TaskModel>>> listing() async {
    try {
      final http.Response response =
          await http.get(Uri(host: AppConstants.API_URL, path: 'tasks'));

      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      return DefaultResponseModel<List<TaskModel>>(
          responseIsTrue: data['result'] as bool,
          message: data['message'] as String,
          data: (data['data'] as List<Map<String, dynamic>>)
              .map(
                (Map<String, dynamic> e) => TaskModel.fromJson(e),
              )
              .toList());
    } catch (e) {
      return DefaultResponseModel<List<TaskModel>>(
          responseIsTrue: false,
          message: 'Bir hata oluştu! TRR : $e}',
          data: <TaskModel>[]);
    }
  }

  @override
  // ignore: strict_raw_type, always_specify_types
  Future<DefaultResponseModel> update(TaskModel task) async {
    try {
      final http.Response response =
          await http.put(Uri(host: AppConstants.API_URL, path: 'tasks'));
      return DefaultResponseModel<void>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      return DefaultResponseModel<void>(
          responseIsTrue: false, message: 'Bir hata oluştu! URR : $e}');
    }
  }
}
