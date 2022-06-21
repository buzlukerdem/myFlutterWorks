main(List<String> args) {
  Ogrenci ogr1 = Ogrenci();
  ogr1.ogrAd = "Erdem";
  ogr1.ogrnNo = 17060255;
  ogr1.aktifMi = true;
  ogr1.dersCalis();
  print(ogr1.ogrAd);
}

class Ogrenci {
  int? ogrnNo; // null olabilir demek.
  String? ogrAd;
  bool? aktifMi;

  void dersCalis() {
    print("Öğrenci ders çalışıyor.");
  }
}
