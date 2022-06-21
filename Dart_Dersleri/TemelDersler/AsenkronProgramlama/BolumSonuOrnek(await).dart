// await yapısı ile yapılan yol.
main(List<String> args) async {
  Map<dynamic, dynamic> gelenUser = await idyeGoreIslemGetir(12);
  print(gelenUser);
  List<String> kurslarListesi =
      await userNameGoreKurslariGetir(gelenUser['username']);
  print(kurslarListesi);
  String yorum = await kursunIlkYorumunuGetir(kurslarListesi[0]);
  print(yorum);
}

Future<String> kursunIlkYorumunuGetir(String kursAdi) {
  print("$kursAdi kursunun yorumu getiriliyor.");
  return Future<String>.delayed(Duration(seconds: 2), () {
    return "Kurs gerçekten benim için çok şey kattı. Tavsiye ediyorum.";
  });
}

Future<List<String>> userNameGoreKurslariGetir(String username) {
  print("$username kullanıcısının kursları getiriliyor.");
  return Future<List<String>>.delayed(Duration(seconds: 3), () {
    return ['flutter', 'javascript', 'kodlin'];
  });
}

Future<Map> idyeGoreIslemGetir(int id) {
  print("$id  id li kullanıcı getiriliyor.");
  return Future<Map<String, dynamic>>.delayed(Duration(seconds: 3), () {
    return {'username': 'erdembuzluk', 'id': id};
  });
}
