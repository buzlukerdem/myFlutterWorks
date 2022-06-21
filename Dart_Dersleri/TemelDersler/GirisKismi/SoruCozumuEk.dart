import 'dart:io';

main(List<String> args) {
  // 5.soru:
  int girilenNot = 0;
  List<int> girilenNotlar = [];
  do {
    print("Sınav notunuzu giriniz, Çıkmak için '-1' yazın.");
    girilenNot = int.parse(stdin.readLineSync()!);
    if (girilenNot >= 0) {
      girilenNotlar.add(girilenNot);
    }
  } while (girilenNot != -1);

  double ort = notlarinOrtalamasiniBul(girilenNotlar);
  print("Ortalama : $ort");
}

double notlarinOrtalamasiniBul(List<int> Liste) {
  int toplam = 0;
  for (int i = 0; i < Liste.length; i++) {
    toplam = toplam + Liste[i];
  }
  return toplam / Liste.length;
}
