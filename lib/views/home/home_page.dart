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
            MyButton(onPressed: controller.onLoginPressed, message: 'login'),
            const SizedBox(
              height: 100,
            ),
            MyButton(
                onPressed: controller.onRegisterPressed, message: 'register')
          ],
        ),
      ),
    );
  }
}
