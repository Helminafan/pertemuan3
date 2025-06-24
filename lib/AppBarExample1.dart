import 'package:flutter/material.dart';

class Appbarexample1 extends StatelessWidget {
  const Appbarexample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh AppBar'),
        leading: IconButton(
          icon: Icon(Icons.menu), onPressed: () {} ),
        actions: [
          IconButton(
            icon: Icon(Icons.search), onPressed: () {} ),
          IconButton(
          icon: Icon(Icons.notifications), onPressed: () {} ),

        ],
        backgroundColor: Colors.blue,
        elevation: 4.0,
        ),
    );
  }
}
