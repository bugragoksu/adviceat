class Malzeme {
  final int malzemeId;
  final String malzemeAdi;
  bool checked=false;

  Malzeme({this.malzemeId, this.malzemeAdi});

  factory Malzeme.fromJson(Map<String, dynamic> json) {
    return Malzeme(
        malzemeId: json['malzemeId'], malzemeAdi: json['malzemeAdi']);
  }
}
