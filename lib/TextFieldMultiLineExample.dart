import 'package:flutter/material.dart';

class TextFieldMultiLineExample extends StatelessWidget {
  const TextFieldMultiLineExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20),
        child: TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            labelText: 'Tulis pesan....',
            border: OutlineInputBorder()
          ),
        ),
      ),
    );
  }
}
