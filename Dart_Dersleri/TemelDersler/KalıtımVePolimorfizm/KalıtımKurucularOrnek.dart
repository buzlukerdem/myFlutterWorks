main(List<String> args) {
  Kisi kisi1 = Kisi("Erdem", 22);
  kisi1.kendiniTanit();
  Calisan kisi2 = Calisan("Kadir", 23, 3500);
  kisi2.kendiniTanit();
  Calisan kisi3 = Calisan("Ramo", 22, 2800);
  kisi3.kendiniTanit();
}

class Kisi {
  String isim;
  int yas;
  Kisi(this.isim, this.yas);

  void kendiniTanit() {
    print("Adım $isim , yaşım $yas.");
  }
}

class Calisan extends Kisi {
  int maas;
  Calisan(String name, int age, this.maas) : super(name, age);
  @override
  void kendiniTanit() {
    super.kendiniTanit();
    print("Maaşım da : $maas");
  }
}
