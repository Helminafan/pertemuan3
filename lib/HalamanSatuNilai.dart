import 'package:flutter/material.dart';
import 'package:pertemuan3/HalamanDuaNilai.dart';

class HalamanSatuNilai extends StatelessWidget {
  const HalamanSatuNilai({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Satu"),
      ), // AppBar
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("Ini adalah halaman ke satu"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Perintah Navigasi atau PUSH untuk menuju ke halaman dua
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HalamanDuaNilai(nilaiUTS: 90),
                    ), // MaterialPageRoute
                  );
                },
                child: Text("Menuju Halaman ke Dua"),
              ), // ElevatedButton
            ],
          ),
        ],
      ), // Row
    ); // Scaffold
  }
}
