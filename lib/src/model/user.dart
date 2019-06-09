class User {
  final int id;
  final String adi;
  final String soyadi;
  final String email;
  final String resimUrl;
  final bool error;

  User({this.id, this.adi, this.soyadi, this.email, this.resimUrl,this.error});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        adi = json['adi'],
        soyadi = json['soyadi'],
        email = json['email'],
        resimUrl = json['fotoUrl'],
        error=json['error'];

}


/*
  tamamlananlar
  giriş
  kayıt
  drawerdaki bilgiler



  yapılacaklar
  yemekleri,malzemeleri vs internetten çek


  */