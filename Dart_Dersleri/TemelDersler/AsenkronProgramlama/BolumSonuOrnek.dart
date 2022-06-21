/* Bir fonksiyon yaz, id parametresine göre bir kullanıcı getirsin.
   Bu işlem 3 saniye sürsün. Getirilen kişi map olarak alınsın.
   Map yapısında username ile id olmalı.
   Username değeri kullanılarak kişinin kurslarını getir.
   Bu işlem 4 saniye sürsün. Getirilen kursun içinde kursların adı olan bir liste döndersin.
   Son olarak kurslar listesinde ki ilk eleman olan parametre kursa ait bir 
   yorumu döndersin . Bu işlem 1 saniye sürsün.
*/

// THEN yapısı ile yapılan örnek.
main(List<String> args) {
  idyeGoreIslemGetir(215).then((value) {
    print(value);
    userNameGoreKurslariGetir(value['username']).then((List Kurslar) {
      print(Kurslar);
      String ilkKurs = Kurslar.first;
      kursunIlkYorumunuGetir(ilkKurs).then((String yorum) {
        print(yorum);
      });
    });
  });
}

Future<String> kursunIlkYorumunuGetir(String kursAdi) {
  print("Kurs yorumu getiriliyor.");
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
