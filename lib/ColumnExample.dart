import 'package:flutter/material.dart';

class Columnexample extends StatelessWidget {
  const Columnexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Widget 1',
              style: TextStyle(fontSize: 20.0, color: Colors.pinkAccent),
            ),
            SizedBox(height: 10.0),
            Text(
              'Widget 2',
              style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
            ),
            SizedBox(height: 10.0),
        Text(
            'Widget 3',
            style: TextStyle(fontSize: 20.0, color: Colors.greenAccent),
        ),
          ],
        ),
      ),
    );
  }
}
