import 'dart:async';
import 'package:adviceat/src/model/malzeme.dart';
import 'package:http/http.dart' as http;

//import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class MalzemeJson {
   static List<Malzeme> malzemeList = new List<Malzeme>();
  
  static Future load() async {
    List jsonParsed = json.decode(await getMalzeme());
    malzemeList = jsonParsed.map((i) => new Malzeme.fromJson(i)).toList();
  }

  static Future<String> getMalzeme() async {
   
    final result = await http.get("http://165.22.84.39/api/malzeme/");
    if (result.statusCode == 200) {

      return utf8.decode(result.bodyBytes);
    } else {
      throw Exception(
          "Veriler getirilirken hata oluştu , Hata kodu : ${result.statusCode}");
    }
    
    
    //return await rootBundle.loadString('assets/yemek.json');
  }
}
