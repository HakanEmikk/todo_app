import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/views/home/home_controller.dart';
import 'package:todo_app/views/login/login_page.dart';
import 'package:todo_app/widgets/my_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put<HomeController>(HomeController());

    return Scaffold(
      body: Container(
        width: 5000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyButton(onPressed: controller.onLoginPressed, message: "login"),
            SizedBox(
              height: 100,
            ),
            MyButton(
                onPressed: controller.onRegisterPressed, message: "register")
          ],
        ),
      ),
    );
  }
}
