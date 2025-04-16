// Nama : Rahmad Firdaus
// NPM  : 2226240074

class Gempa {
  final String tanggal;
  final String jam;
  final String coordinates;
  final String lintang;
  final String bujur;
  final String magnitude;
  final String kedalaman;
  final String wilayah;
  final String potensi;
  final String dirasakan;
  final String shakemap;

  Gempa({
    required this.tanggal,
    required this.jam,
    required this.coordinates,
    required this.lintang,
    required this.bujur,
    required this.magnitude,
    required this.kedalaman,
    required this.wilayah,
    required this.potensi,
    required this.dirasakan,
    required this.shakemap,
  });

  factory Gempa.fromJson(Map<String, dynamic> json) {
    final gempaData = json['Infogempa']['gempa'];
    return Gempa(
      tanggal: gempaData['Tanggal'],
      jam: gempaData['Jam'],
      coordinates: gempaData['Coordinates'],
      lintang: gempaData['Lintang'],
      bujur: gempaData['Bujur'],
      magnitude: gempaData['Magnitude'],
      kedalaman: gempaData['Kedalaman'],
      wilayah: gempaData['Wilayah'],
      potensi: gempaData['Potensi'],
      dirasakan: gempaData['Dirasakan'],
      shakemap: gempaData['Shakemap'],
    );
  }
}
