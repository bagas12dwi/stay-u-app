import 'dart:math';

class Hotel {
  final int id;
  final int nomor;
  final String tipeKamar;
  final int harga;
  final int available;
  final int rate = Random().nextInt(5);

  Hotel(
      {required this.id,
      required this.nomor,
      required this.tipeKamar,
      required this.harga,
        required this.available,});

  factory Hotel.fromJson(Map<String, dynamic> json){
    return Hotel(
        id: json['id'],
        nomor: json['nomor'],
        tipeKamar: json['tipeKamar'],
        harga: json['harga'],
        available: json['available']
    );
  }

}