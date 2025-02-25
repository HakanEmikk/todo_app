import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/my_button.dart';
import '../../widgets/my_text_form_field.dart';
import 'controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 500, right: 500),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 200,
              ),
              MyTextFormField(
                label: 'kullanıcı adı',
                obscureText: false,
                validator: controller.userNameValidator,
                controller: controller.nickController,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(
                label: 'şifre',
                obscureText: true,
                validator: controller.passwordValidator,
                controller: controller.passwordController,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 120,
                height: 50,
                child: MyButton(
                    onPressed: controller.loginOnPressed, message: 'Giriş Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
