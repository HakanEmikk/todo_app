import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  final String label;
  final bool obscureText;
  const MyTextFormField({
    super.key,
    required this.label,
    required this.obscureText,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    
    return Form(
      child: TextFormField(
        
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: widget.label),
      ),
    );
  }
}
