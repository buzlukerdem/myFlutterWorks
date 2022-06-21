main(List<String> args) {
  // 3 tane double sayı ortalaması bul
  double sayi1 = 33;
  double sayi2 = 58;
  double sayi3 = 99;
  double ort = (sayi1 + sayi2 + sayi3) / 3;

  print("Ortalama : $ort");
  print("********************************");

  // Kenarlarını girdiğimiz üçgenin çeşitini bul
  int kenar1 = 25, kenar2 = 20, kenar3 = 15;
  if (kenar1 != kenar2 && kenar2 != kenar3) {
    print(
        "Bu üçgen : 3 kenarıda farklı üçgendir. Kenarları : $kenar1, $kenar2, $kenar3");
  } else if ((kenar1 == kenar2 && kenar1 != kenar3) ||
      (kenar1 == kenar3 && kenar1 != kenar2) ||
      (kenar2 == kenar3 && kenar2 != kenar1)) {
    print(
        "Bu üçgen : İkizkenar üçgendir. Kenarları : $kenar1, $kenar2, $kenar3");
  } else if (kenar1 == kenar2 && kenar2 == kenar3) {
    print("Bu üçgen : Eşkenar üçgendir. Kenarları :$kenar1, $kenar2, $kenar3");
  }
  print("********************************");

  // Vize ve Final notu ile geçip geçmediğini bul
  double vizenot = 66;
  double finalnot = 78;
  double ortnot = (vizenot * 0.4) + (finalnot * 0.6);
  if (ortnot >= 50) {
    print("Dersi Geçtiniz : $ortnot ile");
  } else if (ortnot < 50) {
    print("Dersten kaldınız : $ortnot ile");
  } else {
    print("Hatalı vize veya final notu girilmiştir.");
  }
  print("********************************");

  //1-100 e kadar 15 e tam bölünen sayıların kareleri.

  for (int i = 1; i <= 100; i++) {
    if (i % 15 == 0) {
      print("$i nin karesi : ${i * i}");
    }
  }
  print("********************************");

  // Tanımlanan int bir sayının faktöriyeli.
  int s = 5;
  int toplam = 1;
  for (int i = s; i >= 1; i--) {
    toplam = toplam * i;
  }
  print("Faktöriyel sonucu : $toplam");
}
