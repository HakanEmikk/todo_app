import 'package:flutter/material.dart';
import 'package:todo_app/views/home/home_page.dart';
import 'package:todo_app/widgets/my_button.dart';
import 'package:todo_app/widgets/my_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 500, right: 500),
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              const MyTextFormField(
                label: "kullanıcı adı",
                obscureText: false,
              ),
              const SizedBox(
                height: 50,
              ),
              const MyTextFormField(
                label: "şifre",
                obscureText: true,
              ),
              const SizedBox(
                height: 50,
              ),
              MyButton(onPressed: () {}, message: "Giriş Yap"),
            ],
          ),
        ),
      ),
    );
  }
}
