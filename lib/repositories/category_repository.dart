import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../abstracts/i_category_repository.dart';
import '../models/category_model.dart';
import '../models/default_response_model.dart';
import '../utils/constants.dart';
import '../views/login/controllers/login_controller.dart';
import '../views/task/controller/task_controller.dart';

class CategoryRepository extends ICategoryRepository {
  LoginController controller = Get.put(LoginController());

  @override
  Future<DefaultResponseModel<void>> add(CategoryModel category) async {
    try {
      final http.Response response = await http.post(
          Uri(
              host: AppConstants.API_URL,
              port: AppConstants.API_PORT,
              path: 'category'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
            HttpHeaders.authorizationHeader: 'Bearer ${controller.user.key!}',
          },
          body: jsonEncode({'data': category}));

      return DefaultResponseModel<void>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      return DefaultResponseModel<void>(message: 'Bir hata oluştu! URR : ${e}');
    }
  }

  @override
  Future<DefaultResponseModel<List<CategoryModel>>> get() async {
    try {
      final http.Response response = await http.get(
        Uri(
            host: AppConstants.API_URL,
            port: AppConstants.API_PORT,
            path: 'category'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer ${controller.user.key!}',
        },
      );

      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      final Map<String, dynamic>? datalist =
          data['datalist'] as Map<String, dynamic>?;

      if (datalist == null) {
        throw Exception('Datalist is null');
      }
      final List<dynamic>? dataList = datalist['data'] as List<dynamic>?;
      if (dataList == null) {
        throw Exception('Data list is null');
      }
      return DefaultResponseModel<List<CategoryModel>>(
        message: data['message'] as String,
        data: dataList.map((category) {
          // `category` verilerinin her bir öğesi `Map<String, dynamic>` olmalı
          if (category is Map<String, dynamic>) {
            return CategoryModel.fromJson(category);
          } else {
            throw Exception('Unexpected data format in category');
          }
        }).toList(),
      );
    } catch (e) {
      return DefaultResponseModel<List<CategoryModel>>(
          message: 'Bir hata oluştu! TRR : ${e}', data: <CategoryModel>[]);
    }
  }
}
