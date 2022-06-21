import 'dart:io';

main(List<String> args) {
  print("1. Sınav notunuzu girin : ");
  double sinav1 = double.parse(stdin.readLineSync()!);
  print("2. Sınav notunuzu girin :");
  double sinav2 = double.parse(stdin.readLineSync()!);

  double ortalama = (sinav1 + sinav2) / 2;
  print("ORTALAMANIZ : $ortalama");
  print("*****************************");
  print("Ürünün fiyatını giriniz : ");
  double fiyat = double.parse(stdin.readLineSync()!);
  fiyat = fiyat + fiyat * 0.18;

  print("Ürünün KDV eklenmiş fiyatı : $fiyat");
}
