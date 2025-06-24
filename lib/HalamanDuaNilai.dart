import 'package:flutter/material.dart';

class HalamanDuaNilai extends StatelessWidget {
  int? nilaiUTS;
  HalamanDuaNilai({Key? key, this.nilaiUTS = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Dua Nilai"),
      ), // AppBar
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("Ini adalah halaman ke Dua"),
              SizedBox(height: 10),
              Text("Nilai UTS yang didapatkan adalah : $nilaiUTS"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Kembali ke halaman satu"),
              ), // ElevatedButton
            ],
          ), // Column
        ],
      ), // Row
    ); // Scaffold
  }
}
