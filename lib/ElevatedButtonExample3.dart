import 'package:flutter/material.dart';

class Elevatedbuttonexample3 extends StatelessWidget {
  const Elevatedbuttonexample3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            print('Tombol dengan ikon diklik');
          },
        icon : Icon(Icons.thumb_up),
          label: Text('Like'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
