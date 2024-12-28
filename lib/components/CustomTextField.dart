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
        validator: (val) {
          if (val!.trim().isEmpty) return "$hint is missing";
          return null;
        },
        controller: controller,
        keyboardType: type,
        // inputFormatters: <TextInputFormatter>[
        //   if(type == TextInputType.number)
        //     FilteringTextInputFormatter.digitsOnly
        //   else
        //     FilteringTextInputFormatter.digitsOnly
        // ],
        obscureText: obscure,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey,
            filled: true,
            hintText: hint),
      ),
    );
  }
}
