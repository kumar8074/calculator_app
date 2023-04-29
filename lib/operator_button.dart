import 'package:flutter/material.dart';

import 'main.dart';


class OperatorButtons extends StatelessWidget {
  final String value;
  final Function() onTap;
  const OperatorButtons({super.key, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        operator = value;
        onTap();
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: operator == value ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}