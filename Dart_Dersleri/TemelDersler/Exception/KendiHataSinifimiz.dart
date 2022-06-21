import '../KoleksiyonEkDers/ListSinifiKuruculari.dart';

main(List<String> args) {
  try {
    Ogrenci ogr1 = Ogrenci(-5);
    print(ogr1.yas);
  } on AgeException catch (e) {
    print(e.message);
  } finally {
    print("Program bitti.");
  }
}

class AgeException implements Exception {
  String message;
  // kendi mesajımızı yazmazsak varsayılan olarak burayı alıyor.
  AgeException({this.message = "AgeException"});
  @override
  String toString() {
    return "Hatanın tostring metodu çalıştı.";
  }
}

class Ogrenci {
  int yas = 0;

  Ogrenci(this.yas) {
    if (yas < 0) {
      // kendi mesajımızı yazdık.
      throw AgeException(message: "AgeException-Yaş Negatif Olamaz.");
    } else {
      this.yas = yas;
    }
  }
}
