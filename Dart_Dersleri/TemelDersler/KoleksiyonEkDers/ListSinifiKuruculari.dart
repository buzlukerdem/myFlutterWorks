// iterable : elemanları ard arda okunabilen list veya set yapisidir.
main(List<String> args) {
  Person p1 = Person("Halil", 99);
  Ogrenci o1 = Ogrenci("Betül", 65, 3);
  var p2 = Person("Yunus", 42);
  var o2 = Ogrenci("Ali", 39, 8);

  List<Person> tumOgrenciler = [p1, o1, p2, o2];

  var liste1 = List<Ogrenci>.filled(5, Ogrenci("", 0, 0));
  print(liste1);
  var liste2 = List<Person>.from(tumOgrenciler);
  print(liste2);
  var liste3 = List<Ogrenci>.of(tumOgrenciler.whereType<Ogrenci>());
  print(liste3);
  var liste4 = List<int>.generate(5, (index) => index * 4);
  print(liste4);
  var degistirilemezListe = List.unmodifiable([0, 1, 2]);
  //  yazılamıyor . degistirilemezListe.add(3);
  print(degistirilemezListe);
  // elemanlar arasında 100 den büyük id var mı kontrol ettirdik.
  bool sonuc = tumOgrenciler.any((element) => element.id > 100);
  print(sonuc);
  // listeyi map yapısına dönüştürdük , keyi : int value : Person şeklinde.
  Map<int, Person> yeniMap = tumOgrenciler.asMap();
  print(yeniMap[0]!.isim);
  // bütün elemanların kontrolünü yapar.
  bool sonuc2 = tumOgrenciler.every((element) => element.isim.length > 0);
  print(sonuc2);
  //sıralama
}

class Person {
  String isim = "";
  int id = 0;

  Person(this.isim, this.id);
  @override
  String toString() {
    return "isim : $isim, id: $id\n";
  }
}

class Ogrenci extends Person {
  int dersSayisi = 0;
  Ogrenci(isim, id, dersSayisi) : super(isim, id);
  @override
  String toString() {
    return "isim : $isim, id : $id, Ders sayisi : $dersSayisi\n";
  }
}
