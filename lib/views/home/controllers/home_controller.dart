import 'package:get/get.dart';

class HomeController extends GetxController {
  void onLoginPressed() {
    Get.toNamed<void>('/login_page');
  }

  void onRegisterPressed() {
    Get.toNamed<void>('/register_page');
  }
}
