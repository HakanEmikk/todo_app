import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../abstracts/i_user_repository.dart';
import '../models/default_response_model.dart';
import '../models/user_model.dart';
import '../utils/constants.dart';

class UserRepository extends IUserRepository {
  @override
  Future<DefaultResponseModel<UserModel>> login(UserModel user) async {
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
          body: jsonEncode({'data': user}));

      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      return DefaultResponseModel<UserModel>(
          message: data['message'] as String,
          responseIsTrue: data['result'] as bool,
          data: user);
    } catch (e) {
      return DefaultResponseModel<UserModel>(
          responseIsTrue: false,
          message: 'Bir hata oluştu! URR : $e}',
          data: user);
    }
  }

  @override
  Future<DefaultResponseModel<dynamic>> register(UserModel user) async {
    try {
      print(user.toJson());
      final http.Response response = await http.post(
          Uri(
              scheme: 'http',
              host: AppConstants.API_URL,
              port: AppConstants.API_PORT,
              path: 'users'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'data': user}));

      return DefaultResponseModel<void>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
      return DefaultResponseModel<void>(
          responseIsTrue: false, message: 'Bir hata oluştu! URR : $e}');
    }
  }

  @override
  Future<DefaultResponseModel<void>> update(UserModel user) async {
    try {
      final http.Response response =
          await http.put(Uri(host: AppConstants.API_URL, path: 'users'));
      return DefaultResponseModel<void>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      return DefaultResponseModel<void>(
          responseIsTrue: false, message: 'Bir hata oluştu! URR : $e}');
    }
  }
}
