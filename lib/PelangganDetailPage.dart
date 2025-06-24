import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pertemuan3/PelangganModel.dart';
class PelangganDetailPage extends StatelessWidget {
  final TextEditingController _namaController =
  TextEditingController();
  final TextEditingController _nikController =
  TextEditingController();
  final TextEditingController _alamatController =
  TextEditingController();
  final TextEditingController _noHpController =
  TextEditingController();
  final TextEditingController _latitudeController =
  TextEditingController();
  final TextEditingController _longitudeController =
  TextEditingController();
  String _fotoPath = "temp";
  String _jenisPaket = '10 Mbps';
  String _lamaPaket = '1 bulan';
  double jarakSB = 5.0;
  final PelangganModel pelanggan;
  PelangganDetailPage({required this.pelanggan}) {
    _namaController.text = pelanggan.nama;
    _nikController.text = pelanggan.nik;
    _alamatController.text = pelanggan.alamat;
    _noHpController.text = pelanggan.noHp;
    _latitudeController.text = pelanggan.latitude.toString();
    _longitudeController.text = pelanggan.longitude.toString();
    _jenisPaket = pelanggan.jenisPaket;
    _lamaPaket = pelanggan.lamaPaket;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Pelanggan')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              children: [
              InkWell(
              onTap: () {
        print("Pressed");
        },
          child: Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 30, color:
                  Colors.blue),
                  Text(
                    'Add Image',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: jarakSB),
        TextFormField(
          readOnly: true,
          controller: _namaController,
          decoration: InputDecoration(labelText: 'Nama'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Nama tidak boleh kosong';
            }
            return null;
          },
        ),
        SizedBox(height: jarakSB),
        TextFormField(
          readOnly: true,
          controller: _nikController,
          decoration: InputDecoration(labelText: 'NIK'),
        ),
        SizedBox(height: jarakSB),
        TextFormField(
          readOnly: true,
          controller: _alamatController,
          decoration: InputDecoration(labelText: 'Alamat'),
        ),
        SizedBox(height: jarakSB),
        TextFormField(
          readOnly: true,
          controller: _noHpController,
          decoration: InputDecoration(labelText: 'No HP'),
        ),
        SizedBox(height: jarakSB),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            labelText: 'Jenis Paket',
          ),
          value: _jenisPaket,
          onChanged: null,
          isExpanded: true,
          items:
          ['10 Mbps', '50 Mbps', '100 Mbps', '500 Mbps']
              .map((e) => DropdownMenuItem(value: e, child:
          Text(e)))
              .toList(),
        ),
        SizedBox(height: jarakSB),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            labelText: 'Lama Paket',
// fillColor: Hexcolor('#ecedec'),
// border: CustomBorderTextFieldSkin().getSkin(),
          ),
          isExpanded: true,
          value: _lamaPaket,
          onChanged: null,
          items:
          ['1 bulan', '3 bulan', '6 bulan', '12 bulan']
              .map((e) => DropdownMenuItem(value: e, child:
          Text(e)))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        Expanded(
        child: TextFormField(
        readOnly: true,
          controller: _latitudeController,
          decoration: InputDecoration(labelText:
          'Latitude'),
        ),
      ),
      SizedBox(width: jarakSB),
      Expanded(
        child: TextFormField(
          readOnly: true,
          controller: _longitudeController,
          decoration: InputDecoration(labelText:
          'Longitude'),
        ),
      ),
      SizedBox(width: jarakSB),
      ElevatedButton(onPressed: () {}, child: Text('AmbilLokasi')),
        ],
      ),
        SizedBox(height: jarakSB * 2),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:
            Colors.blue),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back', style: TextStyle(color:
            Colors.white)),
          ),
        ),
        ],
      ),
    ),
    ),
    );
  }
}