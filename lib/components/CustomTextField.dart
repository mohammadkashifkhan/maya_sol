import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscure;
  final String hint;
  final TextInputType type;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.obscure,
      required this.hint,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (val) {
          if (val!.trim().isEmpty) return "$hint is missing";
          return null;
        },
        controller: controller,
        keyboardType: type,
        obscureText: obscure,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(16)),
            fillColor: Colors.blue.shade200,
            filled: true,
            hintText: hint),
      ),
    );
  }
}
