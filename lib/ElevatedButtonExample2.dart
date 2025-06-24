import 'package:flutter/material.dart';

class Elevatedbuttonexample2 extends StatelessWidget {
  const Elevatedbuttonexample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 30, vertical: 15),
            textStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius:
                BorderRadius.circular(10),
          ),
          elevation: 5,
          ),
          onPressed: () {
            print('Tombol Ditekan!');
          },
          child: Text('Klik Saya'),
        ),
      ),
    );
  }
}