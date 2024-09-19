import '../models/default_response_model.dart';
import '../models/user_model.dart';

abstract class IUserRepository {
  Future<DefaultResponseModel<UserModel>> login(UserModel user);
  Future<DefaultResponseModel<dynamic>> register(UserModel user);
  Future<DefaultResponseModel> update(UserModel user);
}
