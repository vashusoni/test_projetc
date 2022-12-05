import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFromFieldWidget extends StatelessWidget {
  const TextFromFieldWidget({
    Key? key,
    required this.hint,
    required this.obscureText,
    required this.controller,
    required this.prefixIcon,
  }) : super(key: key);
  final TextEditingController controller;

  final String hint;
  final bool obscureText;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      enableSuggestions: false,
      autocorrect: false,
      cursorColor: Colors.transparent,
      cursorWidth: 0,
      textAlignVertical: TextAlignVertical.top,
      style: TextStyle(
          decorationThickness: 0,
          decorationColor: Colors.transparent,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(.7)),
      decoration: InputDecoration(
        prefixIconColor: Colors.black54,
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle: TextStyle(fontWeight: FontWeight.w600),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
