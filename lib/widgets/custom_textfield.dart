import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: isPassword
              ? Icon(Icons.visibility, color: Colors.grey.shade500)
              : null,
          hint: Text(hintText, style: TextStyle(color: Colors.grey.shade600)),
        ),
        obscureText: isPassword,
        controller: controller,
      ),
    );
  }
}
