import 'dart:convert';
import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;

import '../abstracts/i_user_repository.dart';
import '../models/default_response_model.dart';
import '../models/user_model.dart';
import '../utils/constants.dart';

class UserRepository extends IUserRepository {
  @override
  Future<DefaultResponseModel<Rx<UserModel>>> login(Rx<UserModel> user) async {
    try {
      final http.Response response = await http.post(
          Uri(
            scheme: 'http',
            host: AppConstants.API_URL,
            port: AppConstants.API_PORT,
            path: 'login',
          ),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'data': user.value}));

      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      return DefaultResponseModel<Rx<UserModel>>(
        message: data['message'] as String,
        token: data['token'] as String,
        data: UserModel.fromJson(data['data'] as Map<String, dynamic>).obs,
      );
    } catch (e) {
      return DefaultResponseModel<Rx<UserModel>>(
          message: 'Bir hata oluştu! URR : $e}', data: user);
    }
  }

  @override
  Future<DefaultResponseModel<void>> register(Rx<UserModel> user) async {
    try {
      print(user.toJson());
      final http.Response response = await http.post(
          Uri(
              scheme: 'http',
              host: AppConstants.API_URL,
              port: AppConstants.API_PORT,
              path: 'register'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'data': user}));

      return DefaultResponseModel<void>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
      return DefaultResponseModel<void>(message: 'Bir hata oluştu! URR : $e}');
    }
  }

  @override
  Future<DefaultResponseModel<Rx<UserModel>>> update(Rx<UserModel> user) async {
    try {
      final http.Response response = await http.put(
          Uri(
            scheme: 'http',
            host: AppConstants.API_URL,
            port: AppConstants.API_PORT,
            path: 'users/${user.value.id}',
          ),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
            HttpHeaders.authorizationHeader: 'Bearer ${user.value.key!}',
          },
          body: jsonEncode({'data': user}));
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      return DefaultResponseModel<Rx<UserModel>>(
        message: data['message'] as String,
        data: UserModel.fromJson(data['datalist'] as Map<String, dynamic>).obs,
      );
    } catch (e) {
      return DefaultResponseModel<Rx<UserModel>>(
          message: 'Bir hata oluştu! URR : $e}');
    }
  }
}
