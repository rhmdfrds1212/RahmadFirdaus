// Nama : Rahmad Firdaus
// NPM  : 2226240074

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_rahmadfirdaus/models/gempa_model.dart';

class ApiService {  
  static Future<Gempa> fetchGempa() async {
    final url = Uri.parse(
      'https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Gempa.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat data gempa');
    }
  }
}
