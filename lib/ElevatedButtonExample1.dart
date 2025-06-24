import 'package:flutter/material.dart';

class Elevatedbuttonexample1 extends StatelessWidget {
  const Elevatedbuttonexample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('Tombol Ditekan!');
          },
          child: Text('Klik Saya'),
        ),
      ),
    );
  }
}
