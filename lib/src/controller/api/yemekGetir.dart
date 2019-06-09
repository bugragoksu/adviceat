import 'dart:async';

import 'package:adviceat/src/controller/api/getMalzeme.dart';
import 'package:adviceat/src/model/food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class YemekJson {
  static List<Recipe> recipeList = new List<Recipe>();
  static Recipe selected = new Recipe();

  static Future load({int secim, int kategoriId}) async {
    try {
      List jsonParsed =
          json.decode(await getYemeks(secim: secim, kategoriId: kategoriId));
      recipeList = jsonParsed.map((i) => new Recipe.fromJson(i)).toList();
      selected = recipeList[0];
    } catch (e) {
      print(e);
    }
  }

  static Future<String> getYemeks({int secim, int kategoriId}) async {
    var result;
    //print(secim);
    if (secim == 0) {
      result = await http.get("http://165.22.84.39/api/yemek/");
    } else if (secim == 1) {
      result =
          await http.get("http://165.22.84.39/api/search/kategori/$kategoriId");
    } else if (secim == 2) {
      String malzemeStr = "";
      List checkedList = new List();
      print(MalzemeJson.malzemeList.length.toString());
      for (int i = 0; i < MalzemeJson.malzemeList.length; i++) {
        if (MalzemeJson.malzemeList[i].checked) {
          print((MalzemeJson.malzemeList[i].malzemeId.toString()));
          checkedList.add((MalzemeJson.malzemeList[i].malzemeId).toString());
        }
      }
      for (var i = 0; i < checkedList.length; i++) {
        malzemeStr += checkedList[i];
        if (i != checkedList.length - 1) {
          malzemeStr += ",";
        }
      }
      print(malzemeStr);

      result = await http.get("http://165.22.84.39/api/search/$malzemeStr");
    } else {
      print("Hatali secim");
    }

    if (result.statusCode == 200) {
      return utf8.decode(result.bodyBytes);
    } else {
      throw Exception(
          "Veriler getirilirken hata oluştu , Hata kodu : ${result.statusCode}");
    }

    //return await rootBundle.loadString('assets/yemek.json');
  }
}
