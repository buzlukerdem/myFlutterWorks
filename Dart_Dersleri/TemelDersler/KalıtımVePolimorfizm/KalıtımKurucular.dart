main(List<String> args) {
  // Asker asker1 = Asker("Erdem", 22);
  Er asker2 = Er("Hasan", 34);
  asker2.memleketDegistir("Ankara");
  asker2.selamla();
  asker2.bilgileriGoster();
}

class Asker {
  String isim = "Varsayılan";
  int yas = 0;
  String memleket = "Samsun";

  Asker(this.isim, this.yas) {
    print("Asker sınıfının kurucusu çalıştı.");
  }

  void selamla() {
    print("$isim $yas emredersiniz komutanım.");
  }
}

//  super üst sınıfa erişimi sağlayıp kurucusunu çalıştırıyor.
class Er extends Asker {
  Er(String isim, int yas) : super(isim, yas) {
    print("Er sınıfının kurucusu çalıştı.");
  }

  void memleketDegistir(String yenimemleket) {
    super.memleket = yenimemleket;
  }

  void bilgileriGoster() {
    print("Er ismi : $isim, yaşı : $yas ve Memleketi : $memleket");
  }

  @override
  void selamla() {
    print("Er sınıfından selamlar.");
  }
}
