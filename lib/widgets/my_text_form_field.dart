import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.onChanged,
    this.validator,
    this.controller,
    required this.label,
    required this.obscureText,
  });
  final String label;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration:
          InputDecoration(border: const OutlineInputBorder(), labelText: label),
    );
  }
}
