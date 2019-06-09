class Kategori{
  final int kategoriId;
  final String kategoriAdi;

  Kategori({this.kategoriId, this.kategoriAdi});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
        kategoriId: json["kategoriId"],
        kategoriAdi:json["kategoriAdi"],
      );
  }
}