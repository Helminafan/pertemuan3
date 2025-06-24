import 'package:flutter/material.dart';
import 'package:pertemuan3/HalamanDua.dart';

class HalamanSatu extends StatelessWidget {
  const HalamanSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman satu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini adalah halaman ke satu'),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HalamanDua(),
                      ));
                },
                child: Text('Menuju Halaman ke dua'))
          ],
        ),
      ),
    );
  }
}