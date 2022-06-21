main(List<String> args) {
  /* eniyi kullanım bu*/ const Student erdem = Student(17060255, "Erdem");
  var erdem2 = const Student(17060255, "Erdem");
  final Student erdem3 = const Student(17060255, "Erdem");
  // erdem.id = 1000; erişilemez.

  // erdem = Student(123123, "samdsa"); erdem nesnesini değiştirebiliyorduk
  // değişmemesi için Student kurucu sınıfı const yapılıyor.
  print(erdem.id);
  print(erdem.isim);

  print("*****");

  if (erdem2 == erdem3) {
    print("eşit");
  } else {
    print("Eşit değil");
  }
}

class Student {
  final int id;
  final String isim;

  const Student(this.id, this.isim);
}
