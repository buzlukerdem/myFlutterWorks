// Asenkron örnekleri : Restoran da garson müşteri mutfak ilişkisi
// Future kelimesi bize : olası bir string değer döndüreceği anlamına gelir.
// Future'ların 2 durumu vardır : uncompleted, completed .
main(List<String> args) {
  print("Anne çocuğu ekmek almaya yolladı.");
  ekmekAlmaSuresi()
      .then((value) => print(value))
      .catchError((hata) => print(hata))
      .whenComplete(() => print("Ekmek alma işlemi tamamlandı."));
  print("Kahvaltılıklar masaya koyuldu.");
  print("Kahvaltı Hazır.");
}

Future<String> ekmekAlmaSuresi() {
  return Future<String>.delayed(Duration(seconds: 2), () {
    return "Çocuk ekmek ile eve girer.";
  });
}
