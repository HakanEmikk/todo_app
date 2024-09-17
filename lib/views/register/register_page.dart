import 'package:flutter/material.dart';
import 'package:todo_app/widgets/my_button.dart';
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
          padding: const EdgeInsets.only(left: 500,right: 500),
          child: Column(
            
            children: [
              SizedBox(height: 200,),
              MyTextFormField(label: "Ad", obscureText: false),
              SizedBox(height: 50,),
              MyTextFormField(label: "soyad", obscureText: false),
              SizedBox(height: 50,),
              MyTextFormField(label: "kulanıcı adı", obscureText: false),
              SizedBox(height: 50,),
              MyTextFormField(label: "şifre", obscureText: true),
              SizedBox(height: 50,),
              MyTextFormField(label: "Mail", obscureText: false),
              SizedBox(height: 50,),
              MyButton(onPressed: (){}, message: "kayıt ol"),
            ],
          ),
        ),
      ),
    );
  }
}
