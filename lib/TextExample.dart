import 'package:flutter/material.dart';

class Textexample extends StatelessWidget {
  const Textexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Halo, ini adalah contoh Text Widget di Flutter!',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
