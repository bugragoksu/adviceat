import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:adviceat/src/model/user.dart';
import 'dart:convert';

class Register {
  Future<User> register(
      String adi, String soyadi, String email, String sifre) async {
    final result = await http.get(
        "http://165.22.84.39/api/kullanici/kayit/$adi/$soyadi/$email/$sifre");

    if (result.statusCode == 200) {
      return User.fromJson(json.decode(result.body));
    } else {
      throw Exception(
          "Kayıt olunurken hata oluştu , Hata kodu : ${result.statusCode}");
    }
  }
}
