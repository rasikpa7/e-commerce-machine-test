import 'package:flutter/material.dart';
import 'package:machinetask/core/colors.dart';


class TextInputField extends StatelessWidget {
   TextInputField({super.key, required this.controller, required this.labelText, required this.icon,  this.isObscure = false});
   TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool isObscure;


  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: const Color(0xffF2F2F2),
        filled: true,
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: TextStyle(fontSize: 13),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor)
        )
        
      ),
      obscureText: isObscure,
    );
  }
}