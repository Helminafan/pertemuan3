import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pertemuan3/DatabaseHelper.dart';
import 'package:pertemuan3/PelangganModel.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
//import 'database_helper.dart';
//import 'form_data.dart';
import 'package:image_picker/image_picker.dart';

class EditForm extends StatefulWidget {
  PelangganModel pelanggan;
   EditForm({super.key, required this.pelanggan});

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  String _jenisPaket = '10 Mbps';
  String _lamaPaket = '1 bulan';
  File? imgFile;
  double? _latitude, _longitude;
  String _fotoPath = 'percobaan';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      print("Form sudah diisi semua");
      PelangganModel formData = PelangganModel(
        nama: _namaController.text,
        nik: _nikController.text,
        alamat: _alamatController.text,
        noHp: _noHpController.text,
        jenisPaket: _jenisPaket,
        lamaPaket: _lamaPaket,
        foto: _fotoPath,
        latitude: double.parse(_latitudeController.text),
        longitude: double.parse(_longitudeController.text),
      );

      DatabaseHelper.instance.insertFormdata(formData);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Data berhasil disimpan!')));
    }
  }
  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Kamera'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Galeri'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imgFile = File(pickedFile.path);
        _fotoPath = pickedFile.path;
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Aktifkan layanan lokasi/GPS!')));
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );
    setState(() {
      _latitude = position.latitude;
      _longitude = position.longitude;
      _latitudeController.text = _latitude.toString();
      _longitudeController.text = _longitude.toString();
    });
  }


  var jarakSB = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulir Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (imgFile != null)
                InkWell(
                  onTap: () {
                    _showImageSourceDialog();
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
                          Icon(Icons.add, size: 30, color: Colors.blue),

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

              if (imgFile == null)
                InkWell(
                  onTap: _showImageSourceDialog,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Image.file(
                      imgFile!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              SizedBox(height: jarakSB),
              TextFormField(
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
                controller: _nikController,
                decoration: InputDecoration(labelText: 'NIK'),
              ),
              SizedBox(height: jarakSB),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
              SizedBox(height: jarakSB),
              TextFormField(
                controller: _noHpController,
                decoration: InputDecoration(labelText: 'No HP'),
              ),
              SizedBox(height: jarakSB),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Jenis Paket',
                  // fillColor: Hexcolor('#ecedec'),
                  // border: CustomBorderTextFieldSkin().getSkin(),
                ),
                value: _jenisPaket,
                onChanged: (value) {
                  setState(() {
                    _jenisPaket = value!;
                    print(_jenisPaket);
                  });
                },
                isExpanded: true,
                items:
                ['10 Mbps', '50 Mbps', '100 Mbps', '500 Mbps']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
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
                onChanged: (value) {
                  setState(() {
                    _lamaPaket = value!;
                  });
                },
                items:
                ['1 bulan', '3 bulan', '6 bulan', '12 bulan']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _latitudeController,
                      decoration: InputDecoration(labelText: 'Latitude'),
                    ),
                  ),
                  SizedBox(width: jarakSB),
                  Expanded(
                    child: TextFormField(
                      controller: _longitudeController,
                      decoration: InputDecoration(labelText: 'Longitude'),
                    ),
                  ),
                  SizedBox(width: jarakSB),
                  ElevatedButton(onPressed: () {}, child: Text('Ambil Lokasi')),
                ],
              ),

              SizedBox(height: jarakSB * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: _submitForm,
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}