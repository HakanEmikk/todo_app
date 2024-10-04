import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../models/default_response_model.dart';
import '../models/user_model.dart';

abstract class IUserRepository {
  Future<DefaultResponseModel<Rx<UserModel>>> login(Rx<UserModel> user);
  Future<DefaultResponseModel<void>> register(Rx<UserModel> user);
  Future<DefaultResponseModel<Rx<UserModel>>> update(Rx<UserModel> user);
}
