/*
  Dart varsayılan olarak hiç bir değişkene null atanmasına izin vermez.
  Buna non-nullable tip denir.
  Uygun veri atanmaz ise size uyarı verecektir.

  Bunu istemiyorsak veri tipinin sonuna ? işareti koyarız.
  Böylece değişkende null değer saklanabilir.
  ? işareti koyarak nullable type oluşturmuş oluruz.
*/
main(List<String> args) {
  int? a;
  a = null;
  print("A değişkeninin değeri : $a");

  List<String> stringListesi = ['a', 'b', 'c'];
  List<String>? nullOlabilecekStringListesi; // string in sonuna ? koyduk
  List<String?> nullDegerlerTutanListe = ['a', null, 'b']; // string in içine.

  print("String listesi : $stringListesi");
  print("Null olabilecek string listesi : $nullOlabilecekStringListesi");
  print("Null değer tutan liste : $nullDegerlerTutanListe");

  // ! in anlamı null değer olmadığını biliyorum demek.
  int x = nullOlabilirAmaDegil!; // sonuna ! koyduk hata olmaması için.
  List<int?> nullDegerOlanListe = [null, 2, 3];
  int y = nullDegerOlanListe.first!;
}

int? nullOlabilirAmaDegil = 1;
