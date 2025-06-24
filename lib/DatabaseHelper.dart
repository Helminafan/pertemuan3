import 'package:pertemuan3/PelangganModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('data_pelanggan.db');
    return _database!;
  }

  Future<Database> _initDB(String path) async {
    final dbPath = await getDatabasesPath();
    final pathToDb = join(dbPath, path);

    return await openDatabase(pathToDb, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    const String tableSql = ''' 
    CREATE TABLE pelanggan (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama TEXT,
    nik TEXT,
    alamat TEXT,
    no_hp TEXT,
    jenis_paket TEXT,
    lama_paket TEXT,
    foto TEXT,
    latitude REAL,
    longitude REAL
    );
    ''';
    await db.execute(tableSql);
  }

  Future<void> insertFormdata(PelangganModel formData) async {
    final db = await instance.database;
    await db.insert('pelanggan', formData.toMap());
  }

  Future<List<PelangganModel>> getAllPelanggan() async {
    Database db = await database;
    var res = await db.query('pelanggan');
    List<PelangganModel> list =
        res.isNotEmpty
            ? res.map((e) => PelangganModel.fromMap(e)).toList()
            : [];
    return list;
  }

  Future<int> deletePelanggan(int id) async {
    final db = await database;
    return await db.delete('pelanggan', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updatePelanggan(PelangganModel pelanggan) async {
    final db = await database;
    return await db.update(
      'pelanggan',
      pelanggan.toMap(),
      where: 'id = ?',
      whereArgs: [pelanggan.id],
    );
  }
}
