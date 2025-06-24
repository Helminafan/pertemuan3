import 'package:flutter/material.dart';

class TextFieldStyleExample extends StatelessWidget {
  const TextFieldStyleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Center(
    child: Padding(
        padding: EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Cari',
          hintText: 'Masukan kata kunci....',
          prefixIcon: Icon(Icons.search),
          border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ),
  ),
    );
  }
}
