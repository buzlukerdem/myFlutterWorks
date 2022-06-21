main(List<String> args) {
  Araba bmw = Araba(2002, "e30", true, 130000);
  // var bmw = Araba(2002, "e30", true); şeklinde de yazabiliriz.
  /*bmw.marka = "e30";
  bmw.modelYili = 2002;
  bmw.otomatikMi = false;*/
  bmw.arabaBilgisiniGoster();
  bmw.arabaYasHesapla();

  var citroen = Araba.markalOlmayanKurucuMetot(2008, false, 98000);
  citroen.arabaBilgisiniGoster();
  citroen.arabaYasHesapla();
}

// marka! şeklinde kullanırsak null değilmiş gibi davranır.
class Araba {
  int? modelyili;
  String? marka;
  bool? otomatikmi;
  int? kilometre;

  Araba(this.modelyili, this.marka, this.otomatikmi, this.kilometre) {
    print("Kurucu metod çalıştı.");
  }

  Araba.markalOlmayanKurucuMetot(
      this.modelyili, this.otomatikmi, this.kilometre) {}

  //2.yol
  /*Araba(int modelYili, String markA, bool otomatikMi) {
    print("Kurucu metod çalıştı.");
    modelyili = modelYili;
    marka = markA;
    otomatikmi = otomatikMi;
    // ikiside aynıysa : this.modelyili = modelyili; başında this gelir
  }
  */

  void arabaBilgisiniGoster() {
    print(
        "Araç markası : ${marka}, modelyılı : ${modelyili}, Otomatik mi : $otomatikmi, KM : $kilometre");
  }

  void arabaYasHesapla() {
    print("Arabanın yaşı : ${2021 - modelyili!}");
  }
}
