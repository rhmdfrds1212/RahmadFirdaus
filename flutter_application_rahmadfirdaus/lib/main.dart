// Nama : Rahmad Firdaus
// NPM  : 2226240074

import 'package:flutter/material.dart';
import 'package:flutter_application_rahmadfirdaus/models/gempa_model.dart';
import 'package:flutter_application_rahmadfirdaus/services/api_services.dart';

void main() {
  runApp(const GempaApp());
}

class GempaApp extends StatelessWidget {
  const GempaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Info Gempa BMKG', home: GempaScreen());
  }
}

class GempaScreen extends StatefulWidget {
  @override
  _GempaScreenState createState() => _GempaScreenState();
}

class _GempaScreenState extends State<GempaScreen> {
  late Future<Gempa> _gempaFuture;

  @override
  void initState() {
    super.initState();
    _gempaFuture = ApiService.fetchGempa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Info Gempa Terkini')),
      body: FutureBuilder<Gempa>(
        future: _gempaFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Data tidak ditemukan'));
          }

          final gempa = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(
                  'Tanggal: ${gempa.tanggal}',
                  style: TextStyle(fontSize: 18),
                ),
                Text('Jam: ${gempa.jam}', style: TextStyle(fontSize: 18)),
                Text(
                  'Koordinat: ${gempa.coordinates}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Lintang: ${gempa.lintang}',
                  style: TextStyle(fontSize: 18),
                ),
                Text('Bujur: ${gempa.bujur}', style: TextStyle(fontSize: 18)),
                Text(
                  'Magnitudo: ${gempa.magnitude}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Kedalaman: ${gempa.kedalaman}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Wilayah: ${gempa.wilayah}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Potensi: ${gempa.potensi}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Dirasakan: ${gempa.dirasakan}',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Image.network(
                  'https://data.bmkg. go.id/DataMKG/TEWS/${gempa.shakemap}',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
