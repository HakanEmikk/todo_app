import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text_form_field.dart';

import 'controllers/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 500, right: 500),
        child: Form(
          key: controller.registerFormKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 200,
              ),
              MyTextFormField(
                label: 'Ad',
                obscureText: false,
                validator: controller.nameValidator,
                controller: controller.nameController,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(
                label: 'soyad',
                obscureText: false,
                validator: controller.surnameValidator,
                controller: controller.surnameController,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(
                label: 'kulanıcı adı',
                obscureText: false,
                validator: controller.nicknameValidator,
                controller: controller.nicknameController,
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
              MyTextFormField(
                label: 'Mail',
                obscureText: false,
                validator: controller.mailValidator,
                controller: controller.mailController,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 120,
                height: 50,
                child: MyButton(
                  onPressed: controller.registerOnPressed,
                  message: 'kayıt ol',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
