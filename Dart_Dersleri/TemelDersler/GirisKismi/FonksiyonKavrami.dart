main(List<String> args) {
  cevreHesapla();
  int alan = alanHesapla(5, 10);
  print("Alan : $alan");

  double hacim = hacimHesapla(5.0, 10.0, 13.0);
  print(("Hacim : $hacim"));

  print("Yeni Hacim : " + hacimHesapla(10, 10, 10).toString());

  print("Büyük sayı : " + maxOlaniBul(55, 88).toString());

  print("Toplam : " + sayilariTopla(5).toString()); // sadece 5 i aldı

  print("Çarpım : " + sayilariCarp(x3: 8, x2: 15).toString()); // sonucu 0
}

// Parametresiz
void cevreHesapla() {
  int en = 5;
  int boy = 10;
  int cevre = (en * 2) + (boy * 2);
  print("Çevre : $cevre");
}

// Paremetreli ve required versiyon
int alanHesapla(int en, int boy) {
  return en * boy;
}

// Kısa yol versiyonu.

// int alanHesapla(int en, int boy) => en * boy;

double hacimHesapla(double en, double boy, double yukseklik) {
  return en * boy * yukseklik;
}

int maxOlaniBul(int sayi1, int sayi2) => sayi1 < sayi2 ? sayi2 : sayi1;

//optional versiyon
int sayilariTopla(int s1, [int s2 = 0]) => s1 + s2;

// optional named (ilk başta istersem x3 ü sonra x1 sonra x2 değerini girerim )
// = 0 dememizin nedeni biz değer girmezsek 0 olarak alacak.
int sayilariCarp({int x1 = 0, int x2 = 0, int x3 = 0}) => (x1 * x2 * x3);
