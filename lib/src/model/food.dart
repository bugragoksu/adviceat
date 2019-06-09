class Recipe {
  int yemekId;
  String yemekAdi;
  String yemekTarif;
  String yemekResimUrl;

  Recipe({this.yemekId, this.yemekAdi, this.yemekTarif, this.yemekResimUrl});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      yemekId: json['yemekId'],
      yemekAdi: json['yemekAdi'],
      yemekTarif: json['yemekTarif'],
      yemekResimUrl: json['yemekResimUrl'],
    );
  }
}
