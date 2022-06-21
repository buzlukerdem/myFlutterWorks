main(List<String> args) {
  int sayi1 = 25;
  int sayi2 = 30;
  int kucuksayi;

  sayi1 < sayi2 ? kucuksayi = sayi1 : kucuksayi = sayi2;
  print("Küçük sayı : $kucuksayi");
  print("Oh be");

  for (int i = 0; i <= 10; i++) {
    if (i > 7) {
      break; // 8.sayı sağladığı için döngü den çıkıyor.
    }
    print("$i . sayı");
  }
}
