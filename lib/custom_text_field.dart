import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function() onTap;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onTap();
      },
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

