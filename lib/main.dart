import 'package:flutter/material.dart';
import 'package:calculator_app/operator_button.dart';
import 'custom_text_field.dart';
import 'dart:math';

void main() {
  runApp(
    const MyApp(
      title: "My Calculator",
    ),
  );
}

class MyApp extends StatefulWidget {
  final String title;
  const MyApp({super.key, required this.title});

  @override
  State<MyApp> createState() => _MyAppState();
}

String? operator;

class _MyAppState extends State<MyApp> {
  TextEditingController valueOneController = TextEditingController();
  TextEditingController valueTwoController = TextEditingController();

  double? result;
  String? error;
  bool isEmptyController() {
    return valueOneController.text.isEmpty || valueTwoController.text.isEmpty;
  }

  calculate() {
    if (isEmptyController()) {
      error = "Enter both values";
      setState(() {});
      return;
    }
    double valueOne = double.parse(valueOneController.text);
    double valueTwo = double.parse(valueTwoController.text);
    switch (operator) {
      case "+":
        result = valueOne + valueTwo;
        error = "";
        break;
      case "-":
        result = valueOne - valueTwo;
        error = "";
        break;
      case "*":
        result = valueOne * valueTwo;
        error = "";
        break;
      case "/":
        if (valueTwo == 0) {
          result = null;
          error = "Division by zero not allowed";
        } else {
          result = valueOne / valueTwo;
          error = "";
        }
        break;

      default:
        error = "please select a operator";
    }
    setState(() {});
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextField(
                hintText: "Enter value 1",
                controller: valueOneController,
                onTap: () {
                  setState(
                    () {},
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Enter value 2",
                controller: valueTwoController,
                onTap: () {
                  setState(
                    () {},
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["+", "-", "*", "/"]
                    .map(
                      (e) => OperatorButtons(
                        value: e,
                        onTap: () {
                          setState(
                            () {},
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  calculate();
                },
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: isEmptyController() ? Colors.grey : Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              if (result != null)
                Text(
                  result.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
              if (error != null)
                Text(
                  error.toString(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
