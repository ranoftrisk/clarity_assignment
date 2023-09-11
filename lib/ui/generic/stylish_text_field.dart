import 'package:clarity_assignment/utils/styles.dart';
import 'package:flutter/material.dart';

class StylishTextField extends StatelessWidget {

  final String? hint;
  final TextEditingController? controller;

  const StylishTextField({super.key, this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        fontSize: 18.0,
        color: ColorStyles.textFieldColor, // Text color
      ),
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: const TextStyle(
          color: ColorStyles.textFieldColor, // Label text color
        ),
        filled: true,
        fillColor: Colors.grey[200], // Background color
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorStyles.textFieldColor, // Border color
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorStyles.textFieldColor, // Focused border color
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}