import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/my_button.dart';
import '../../widgets/my_text_form_field.dart';
import '../login/controllers/login_controller.dart';
import 'controller/profile_controller.dart';

class ProfilUpdatePage extends StatefulWidget {
  const ProfilUpdatePage({super.key});

  @override
  State<ProfilUpdatePage> createState() => _ProfilUpdatePageState();
}

class _ProfilUpdatePageState extends State<ProfilUpdatePage> {
  ProfileController controller = Get.put(ProfileController());
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Profil Güncelle',
          style: TextStyle(fontSize: 50),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 500, right: 500),
        child: Form(
          key: controller.updateFormKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 200,
              ),
              MyTextFormField(
                label: 'Ad',
                hintText: loginController.user.name,
                obscureText: false,
                validator: controller.nameValidator,
                controller: controller.nameController,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(
                label: 'soyad',
                hintText: loginController.user.surname,
                obscureText: false,
                validator: controller.surnameValidator,
                controller: controller.surnameController,
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(
                label: 'kulanıcı adı',
                hintText: loginController.user.nickname,
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
                hintText: loginController.user.mail,
                obscureText: false,
                validator: controller.mailValidator,
                controller: controller.mailController,
              ),
              const SizedBox(
                height: 50,
              ),
              MyButton(
                onPressed: controller.updateOnPressed,
                message: 'güncelle',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
