import 'dart:async';

import 'package:adviceat/src/model/food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KategoriYemekJson {
  final String serverUrl="http://104.248.254.113/api/";
  static List<Recipe> recipeList = new List<Recipe>();
  static Recipe selected = new Recipe();

  static Future load({int secim,int kategoriId,List malzemeList}) async {
    List jsonParsed;
    if(secim==0){
        jsonParsed = json.decode(await getYemeks(secim,kategoriId,malzemeList));
    }
    
    recipeList = jsonParsed.map((i) => new Recipe.fromJson(i)).toList();
    selected = recipeList[0];
    
  }
  //kategoriye gore yemek arama tamamlanmadı
  static Future<String> getYemeks(int secim,int kategoriId,List malzemeList) async {
    final result = await http.get("http://165.22.84.39/api/yemek/kategori/${kategoriId}");

    if (result.statusCode == 200) {
      return utf8.decode(result.bodyBytes);
    } else {
      throw Exception(
          "Veriler getirilirken hata oluştu , Hata kodu : ${result.statusCode}");
    }

    //return await rootBundle.loadString('assets/yemek.json');
  }
}
