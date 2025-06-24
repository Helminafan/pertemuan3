import 'package:flutter/material.dart';

class Containerexample1 extends StatelessWidget {
  const Containerexample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contoh Container')),
      body: Center(
        child: Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset:Offset(3, 3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
