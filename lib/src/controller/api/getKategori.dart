import 'dart:async';

import 'package:adviceat/src/model/kategori.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class KategoriJson {
   static List<Kategori> kategoriList = new List<Kategori>();

  static Future load() async {
    List jsonParsed = json.decode(await getKategoris());
    kategoriList = jsonParsed.map((i) => new Kategori.fromJson(i)).toList();
  }

  static Future<String> getKategoris() async {
   /*
    final result = await http.get("http://165.22.79.16/api/kategori");
    if (result.statusCode == 200) {
      return result.body;
    } else {
      throw Exception(
          "Veriler getirilirken hata oluştu , Hata kodu : ${result.statusCode}");
    }
    */
    
    return await rootBundle.loadString('assets/yemek.json');
  }
}
