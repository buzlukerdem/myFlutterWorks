main(List<String> args) {
  int sayi = 4;

  // Varsayılan olarak 0 değerini alan 3 tane indix değer koyduk.
  List<int> sayilar = List.filled(3, 0, growable: false);
  for (int i = 0; i < 3; i++) {
    sayilar[i] = sayi += 2;
  }
  print(sayilar);
  print(sayilar.length);

  List<String> isimler = List.filled(2, "");
  isimler[0] = 5.toString();
  isimler[1] = "Gaci";
  print(isimler);

  print("*****");
  for (int oankiEleman in sayilar) {
    print(oankiEleman);
  }

  List<dynamic> dsayilar = List<dynamic>.filled(5, 0);
  // dynamic de string int karışık kullanılabilir.
  dsayilar[0] = "Erdem";
  dsayilar[1] = 11;
  print(dsayilar);
}
