import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pertemuan3/DatabaseHelper.dart';
import 'package:pertemuan3/EditForm.dart';
import 'package:pertemuan3/PelangganModel.dart';
import 'AddForm.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  late  Future<List<PelangganModel>> pelangganList;

  @override
  void initState() {
    super.initState();
    pelangganList = DatabaseHelper.instance.getAllpelanggan();
  }

  _refreshData(){
    setState(() {
      pelangganList = DatabaseHelper.instance.getAllpelanggan();
    });
  }

  Future<void> _showDeleteDialog(BuildContext context, PelangganModel pelanggan, Function onDelete,) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: Text(
            "apakah anda yakin ingin menghapus data pelanggan '${pelanggan.nama}'?",
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Batal'),
              onPressed: (){
                Navigator.of(dialogContext).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Hapus'),
              onPressed: () async {
                Navigator.of(dialogContext).pop();

                await onDelete();
              },
            )
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          bool? refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddForm()),);
          if (refresh == true){
            _refreshData();
          };
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("HomeScreen")),
      body: Column(
        children: [
          SizedBox(height: 16,),
          Expanded(
            child: FutureBuilder<List<PelangganModel>>(
              future: pelangganList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.data! .isEmpty) {
                    return Center(child: Text('Belum ada data pelanggan'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data! .length,
                    itemBuilder: (context, index) {
                      PelangganModel pelanggan = snapshot.data! [index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.grey.shade400, width: 1),
                        ),
                        child: ListTile(
                          leading: pelanggan.foto != null
                              ? CircleAvatar(
                            radius: 25,
                            backgroundImage: FileImage(File(pelanggan.foto!)),
                          )
                              : CircleAvatar(
                            radius: 25,
                            child: Icon(Icons.person),
                          ),
                          title: Text(pelanggan.nama),
                          subtitle: Text('${pelanggan.jenisPaket}, ${pelanggan.lamaPaket}, ${pelanggan.email}',
                            style: TextStyle(
                                fontSize: 10
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () async {
                                  bool? refresh = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditForm(pelanggan: pelanggan),
                                    ),
                                  );
                                  if (refresh == true) {
                                    _refreshData();
                                  }
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () async {
                                  _showDeleteDialog(context, pelanggan, () async {
                                    var res = await DatabaseHelper.instance.deletePelanggan(pelanggan.id!);
                                    if (res == 1) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Data dihapus')),
                                      );
                                      _refreshData();
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      );
                    }
                  );
                }
              }
            ),
          ),
        ],
      )
    );
  }
}