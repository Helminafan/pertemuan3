import 'package:flutter/material.dart';

class TextFieldPasswordExample extends StatelessWidget {
  const TextFieldPasswordExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(10.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
