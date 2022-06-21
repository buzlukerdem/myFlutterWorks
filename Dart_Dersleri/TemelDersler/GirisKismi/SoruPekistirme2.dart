main(List<String> args) {
  print("Çift Sayıların Toplamı : " + ciftToplam(6).toString());

  print("Dairenin Alanı : " + daireAlan(5).toString());
}

int ciftToplam(int sayi) {
  int toplam = 0;
  for (int i = 0; i <= sayi; i++) {
    if (i % 2 == 0) {
      toplam = toplam + i;
    }
  }
  return toplam;
}

// değeri vermezsek 3.14 alır
double daireAlan(double r, [double pi = 3.14]) {
  return pi * r * r;
}
