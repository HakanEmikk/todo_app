import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key, required this.onPressed, required this.message});
  final void Function() onPressed;
  final String message;
  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        child: Text(widget.message),
        style: TextButton.styleFrom(backgroundColor: Colors.black12));
  }
}
