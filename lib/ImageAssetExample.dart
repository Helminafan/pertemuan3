import 'package:flutter/material.dart';

class ImageAssetExample extends StatelessWidget {
  const ImageAssetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logopoliwangi.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
