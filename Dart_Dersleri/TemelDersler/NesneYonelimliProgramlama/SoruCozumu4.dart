/*  Ogrenci isimli sınıf oluşturun. Bu sınıfta ogrencinin id'si ve not değeri
  tutulmalı 100 elemanlı bir liste de id ve not değerlerini rastgele oluşturarak
  bu ogrencileri saklayın ve ogrencileri yazdırın.
  */

import 'dart:math';
import 'OgrenciCozum.dart';

main(List<String> args) {
  OgrenciCozum ogr1 = OgrenciCozum(id: 17, not: 50);
  List<OgrenciCozum> tumogrenciler = List.filled(5, OgrenciCozum());
  print(ogr1);
  // main den ogrencilistesinidoldur için parametre kullanılır.
  ogrenciListesiDoldur(tumogrenciler);
  for (OgrenciCozum oankiogrenciler in tumogrenciler) {
    print(oankiogrenciler);
  }

  print("Ogrencilerin not ortalaması : " +
      notortalamasiBul(tumogrenciler).toString());
}

void ogrenciListesiDoldur(List<OgrenciCozum> liste) {
  // bu fonksiyondan main e ifade yollamak için return kullanılır.
  for (int i = 0; i < liste.length; i++) {
    liste[i] =
        OgrenciCozum(id: Random().nextInt(1000), not: Random().nextInt(100));
  }
}

double notortalamasiBul(List<OgrenciCozum> liste) {
  int toplam = 0;
  for (OgrenciCozum oankiOgrenci in liste) {
    toplam = toplam + oankiOgrenci.not;
  }

  return toplam / liste.length;
}
