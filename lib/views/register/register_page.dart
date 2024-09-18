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
                onChanged: controller.nameOnChanged,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(
                label: 'soyad',
                obscureText: false,
                validator: controller.surnameValidator,
                onChanged: controller.surnameOnChanged,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(
                label: 'kulanıcı adı',
                obscureText: false,
                validator: controller.nicknameValidator,
                onChanged: controller.nicknameOnChanged,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(
                label: 'şifre',
                obscureText: true,
                validator: controller.passwordValidator,
                onChanged: controller.passwordOnChanged,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(
                label: 'Mail',
                obscureText: false,
                validator: controller.mailValidator,
                onChanged: controller.mailOnChanged,
              ),
              const SizedBox(
                height: 50,
              ),
              MyButton(
                onPressed: controller.registerOnPressed,
                message: 'kayıt ol',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
