import 'package:get/get.dart';

class HomeController extends GetxController {
  void onLoginPressed() {
    Get.toNamed('/login_page');
  }

  void onRegisterPressed() {
    Get.toNamed('/register_page');
  }
}
