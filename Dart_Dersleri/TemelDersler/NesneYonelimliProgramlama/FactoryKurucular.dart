main(List<String> args) {
  Ogrenci ogr1 = Ogrenci(170, "Erdem");
  Ogrenci ogr2 = Ogrenci.Isimsiz(150);
  Ogrenci ogr3 = Ogrenci.factoryKurucusu(-120, "Cihan");
  print(ogr1);
  print(ogr2);
  print(ogr3.id);
  print(ogr3.isim);
  // print("Toplam : " + topla(25, 15).toString());
}

/*int topla(int s1, int s2) {
  return s1 + s2;
}
*/
class Ogrenci {
  int id = 0;
  String isim = "";

  Ogrenci(this.id, this.isim) {
    print("Kurucu metot çalıştı.");
  }

  Ogrenci.Isimsiz(this.id) {
    print("İsimsiz kurucu metot çalıştı.");
  }

  // Kendi şartlarımızı yazabiliriz ve Return kullanabiliriz.

  factory Ogrenci.factoryKurucusu(int id, String isim) {
    if (id < 0) {
      return Ogrenci(1, isim); // Varsayılan olarak 1 alır.
    } else {
      return Ogrenci(id, isim);
    }
  }
}
