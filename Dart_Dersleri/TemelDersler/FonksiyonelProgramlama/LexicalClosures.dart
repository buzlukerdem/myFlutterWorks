/*
  Closure özel bir fonksiyondur. 
  Closure ile bir üst kapsamdaki değişkenlerin değerlerini değiştirebiliriz.
*/
main(List<String> args) {
  /*
  var mainDegiskeni = 1;

  void a() {
    var aDegiskeni = 2;

    void b() {
      var bDegiskeni = 3;
      print(aDegiskeni);
      print(mainDegiskeni);
      //  bu printler bi anlam ifade etmiyor. ama b hem a ya hem main e erişebiliyor.
    }
  }
  */
  // Lexical Variable Scope olayı. : dondurulenFonksiyon çalıştıgında bir sonraki satıra geçtiğinde 7 değeri kaybolması gerekirken kaybolmadı.
  var dondurulenFonksiyon = topla(7);
  var sonuc = dondurulenFonksiyon(8);
  print("Sonuç : $sonuc");
}

Function topla(int eleman) {
  return (int deger) => eleman * deger;
}
