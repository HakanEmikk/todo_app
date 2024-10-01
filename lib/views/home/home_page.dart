import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/my_button.dart';

import 'controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put<HomeController>(HomeController());

    return Scaffold(
      body: SizedBox(
        width: 5000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 50,
              child: MyButton(
                  onPressed: controller.onLoginPressed, message: 'Giriş Yap'),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 120,
              height: 50,
              child: MyButton(
                  onPressed: controller.onRegisterPressed, message: 'Kayıt Ol'),
            )
          ],
        ),
      ),
    );
  }
}
