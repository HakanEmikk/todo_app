import '../models/default_response_model.dart';
import '../models/user_model.dart';

abstract class IUserRepository {
  Future<DefaultResponseModel<UserModel>> login(UserModel user);
  Future<DefaultResponseModel<void>> register(UserModel user);
  Future<DefaultResponseModel<UserModel>> update(UserModel user);
}
