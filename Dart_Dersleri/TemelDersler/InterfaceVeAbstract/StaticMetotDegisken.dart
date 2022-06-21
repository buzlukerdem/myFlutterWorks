// static metotların içinde this. kullanılmaz
// Nesne tabanlı fonksiyonlar içinde staticlere erişilebilir.
// Ama Staticler nesnelere erişemez.
main(List<String> args) {
  Matematik m1 = Matematik(50, 35);
  m1.sayilariTopla();
  m1.sayilariCarp();
  m1.sayilariTopla();
  m1.sayilariCarp();
  print(Matematik.PI);
  Matematik.sinifAdiniSoyle();
  print(Matematik.toplamIslemSayisi);
}

class Matematik {
  // instance variable , bunlar static alan içerisinde erişilemezler.
  int sayi1 = 0;
  int sayi2 = 0;
  static int toplamIslemSayisi = 0;
  // class variable (sınıf değişkeni)

  // sınıf üzerinden erişiliyor satır 10 da ki gibi.
  static double PI = 3.14;
  static void sinifAdiniSoyle() {
    print("Ben matematik sınıfındanım.");
  }

  Matematik(this.sayi1, this.sayi2);

  void sayilariTopla() {
    toplamIslemSayisi++;
    print("Sayıların toplamı : ${sayi1 + sayi2}");
  }

  void sayilariCarp() {
    toplamIslemSayisi++;
    print("Sayıların çarpımı : ${sayi1 * sayi2}");
  }
}
