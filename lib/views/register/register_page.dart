import 'package:flutter/material.dart';
import 'package:todo_app/widgets/my_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextFormField(label: "Ad", obscureText: false),
              MyTextFormField(label: "soyad", obscureText: false),
              MyTextFormField(label: "kulanıcı adı", obscureText: false),
              MyTextFormField(label: "şifre", obscureText: true),
              MyTextFormField(label: "Mail", obscureText: false),
            ],
          ),
        ),
      ),
    );
  }
}
