class Booking {
  final String tglPesan;
  final String tglAkhir;
  final int id;

  Booking({required this.id, required this.tglPesan, required this.tglAkhir});

  Map<String, dynamic> toJson() {
    return {
      'tglPesan': tglPesan,
      'tglAkhir': tglAkhir,
      'id': id
    };
  }
}