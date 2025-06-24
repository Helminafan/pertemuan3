class PelangganModel {
  final String nama;
  final String nik;
  final String alamat;
  final String noHp;
  final String jenisPaket;
  final String lamaPaket;
  final String foto;
  final double latitude;
  final double longitude;
  final int? id;

  PelangganModel({
    this.id,
    required this.nama,
    required this.nik,
    required this.alamat,
    required this.noHp,
    required this.jenisPaket,
    required this.lamaPaket,
    required this.foto,
    required this.latitude,
    required this.longitude,
  });
  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'nik': nik,
      'alamat': alamat,
      'no_hp': noHp,
      'jenis_paket': jenisPaket,
      'lama_paket': lamaPaket,
      'foto': foto,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  static PelangganModel fromMap(Map<String, dynamic> map) {
    return PelangganModel(
      id: map['id'],
      nama: map['nama'],
      nik: map['nik'],
      jenisPaket: map['jenis_paket'],
      lamaPaket: map['lama_paket'],
      foto: map['foto'],
      alamat: map['alamat'],
      noHp: map['no_hp'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}