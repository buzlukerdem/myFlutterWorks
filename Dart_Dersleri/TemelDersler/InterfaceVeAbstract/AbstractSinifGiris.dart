/* Abstract soyut sınıf : Sınıflar arasında soyutlama yapmak için kullanilir.
  !!!!!!!! Abstract sınıflardan nesne üretilmez.
  Abstract metotlar alt sınıflarca override edilmek zorundadır.
  Bir sınıfta bir tane abstract metot varsa o sınıf mutlaka abstract tanımlanmalıdır.
  */
main(List<String> args) {
  Sekil s1 = Kare(5);
  print(s1.alanHesapla());
  Sekil s2 = Dikdortgen(6, 10);
  print(s2.alanHesapla());

  print("*********");
  List<Sekil> tumSekiller = [];
  tumSekiller.add(s1);
  tumSekiller.add(s2);

  test(s1);
  test(s2);
}

void test(Sekil sekil) {
  sekil.selamla();
}

// sekil bi soyut olduğu için onu abstract yaptık
abstract class Sekil {
  double alanHesapla();
  double cevreHesapla();
  void selamla() {
    print("Sekil selamladı."); // selamla fonksiyonu da kullanılabilmekte.
  }
}

class Kare extends Sekil {
  int kenar;

  Kare(this.kenar);
  @override
  double alanHesapla() {
    return (kenar * kenar).toDouble();
  }

  @override
  double cevreHesapla() {
    return (4 * kenar).toDouble();
  }

  @override
  void selamla() {
    print("Kare selamladı.");
  }
}

class Dikdortgen extends Sekil {
  double kenar1;
  double kenar2;
  Dikdortgen(this.kenar1, this.kenar2);

  @override
  double alanHesapla() {
    return kenar1 * kenar2;
  }

  @override
  double cevreHesapla() {
    return 2 * (kenar1 + kenar2);
  }

  @override
  void selamla() {
    print("Dikdörtgen selamladı.");
  }
}
