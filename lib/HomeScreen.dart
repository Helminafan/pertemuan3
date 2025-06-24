import 'package:flutter/material.dart';
import 'package:pertemuan3/AddForm.dart';
import 'PelangganModel.dart';
import 'DatabaseHelper.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<PelangganModel>> pelangganList;

  @override
  void initState() {
    super.initState();
    pelangganList = DatabaseHelper.instance.getAllPelanggan();
  }

  _refreshData() {
    setState(() {
      pelangganList = DatabaseHelper.instance.getAllPelanggan();
    });
  }

  Future<void> _showDeleteDialog(
    BuildContext context,
    PelangganModel pelanggan,
    Function onDelete,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User harus memilih salah satu aksi
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: Text(
            'Apakah Anda yakin ingin menghapus data pelanggan"${pelanggan.nama}"?',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Tutup dialog
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Hapus'),
              onPressed: () async {
                Navigator.of(dialogContext).pop(); // Tutup dialog lebih dulu
                await onDelete(); // Jalankan aksi hapus
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? refresh = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddForm()),
          );
          if (refresh == true) {
            _refreshData();
          }
        },
        child: Icon(Icons.add),
      ),

      appBar: AppBar(title: Text("HomeScreen")),
      body: FutureBuilder<List<PelangganModel>>(
        future: pelangganList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data!.isEmpty) {
            return Center(child: Text('Belum Ada Data Pelanggan.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                PelangganModel pelanggan = snapshot.data![index];
                return ListTile(
                  title: Text(pelanggan.nama),
                  subtitle: Text(
                    '${pelanggan.jenisPaket}, ${pelanggan.lamaPaket}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          /**digunakan edit*/
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          /**digunakan edit*/
                        },
                      ),

                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          _showDeleteDialog(context, pelanggan, () async {
                            var res = await DatabaseHelper.instance
                                .deletePelanggan(pelanggan.id!);
                            if (res == 1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Data dhapus')),
                              );
                              _refreshData();
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    /**digunakan detail data*/
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
