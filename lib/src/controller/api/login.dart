import 'dart:async';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:adviceat/src/model/user.dart';
import 'dart:convert';

class Login {
  bool error;
  String err;

  static User user = new User(); 

  static Future load(String email,String sifre) async {
    Map<String,dynamic> jsonParsed = json.decode(await login(email,sifre));
    user = new User.fromJson(jsonParsed);
  }
  

  static Future<String> login(String email, String sifre) async {
    final result =
        await http.get("http://165.22.84.39/api/kullanici/giris/$email/$sifre");

    if (result.statusCode == 200) {
      var myjson = json.decode(result.body);
      bool error = myjson["error"];

      return result.body;
    } else {
      throw Exception(
          "Giriş yapılırken hata oluştu , Hata kodu : ${result.statusCode}");
    }
  }
}
