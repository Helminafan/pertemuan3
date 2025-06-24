import 'package:flutter/material.dart';

class StatefulExample extends StatefulWidget {
  const StatefulExample({super.key});

  @override
  State<StatefulExample> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int angka = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nilai Angka $angka"),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                  });
                  angka = angka + 1;
                },
                child: Text("Tambah !")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                  });
                  angka = angka - 1;
                }, child: Text("Kurang !")),
          ],
        ),
      ),
    );
  }
}

