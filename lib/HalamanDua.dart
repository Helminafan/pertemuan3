import 'package:flutter/material.dart';

class HalamanDua extends StatelessWidget {
  const HalamanDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Dua"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini adalah halaman ke dua'),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kembali ke halaman satu'))
          ],
        ),
      ),
    );
  }
}