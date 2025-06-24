import 'package:flutter/material.dart';

class TextFieldexample extends StatelessWidget {
  const TextFieldexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20),
        child: TextField(
          decoration: InputDecoration(
            //labelText: 'Masukkan Teks',
            label: Text("INI ADALAH LABEL"),
            hintText: 'Masukkan password',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
