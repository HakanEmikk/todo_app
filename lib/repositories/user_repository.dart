import '../abstracts/i_user_repository.dart';
import '../models/default_response_model.dart';
import '../models/user_model.dart';

class UserRepository extends IUserRepository {
  @override
  Future<DefaultResponseModel> login(UserModel user) {
    return Future<DefaultResponseModel>.delayed(
      const Duration(seconds: 1),
      () =>
          DefaultResponseModel(responseIsTrue: true, message: 'Giriş yapıldı'),
    );
  }

  @override
  Future<DefaultResponseModel> register(UserModel user) {
    return Future<DefaultResponseModel>.delayed(
      const Duration(seconds: 1),
      () => DefaultResponseModel(responseIsTrue: true, message: 'kayıt olundu'),
    );
  }

  @override
  Future<DefaultResponseModel> update(UserModel user) {
    return Future<DefaultResponseModel>.delayed(
      const Duration(seconds: 1),
      () => DefaultResponseModel(responseIsTrue: true, message: 'güncellendi'),
    );
  }
}
