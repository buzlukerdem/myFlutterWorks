import 'MusteriOrnek.dart';
import 'VeriTabaniIslemleri.dart';

main(List<String> args) {
  // VeriTabaniIslemleri db = VeriTabaniIslemleri();
  VeriTabaniIslemleri db2 =
      VeriTabaniIslemleri.LoginWithinUsernameAndPassowrd("admin", "123");

  // MusteriOrnek dersinin kod kısmı.
  Musteri m1 = Musteri(8542);
  m1.musteriNoAta = 555;
  print(m1.musteriNoSoyle);
  m1.bilgileriYazdir();

  bool sonuc = db2.baglan();
  // sonuc u direk doğru sayıyor burda.
  if (sonuc) {
    print("Bağlanma işlemi başarılı");
  } else {
    print("Bağlanma işlemi başarısız");
  }
}
// Sınıf yapısı ile main yapısı aynı dosya içinde ise private kullanamayız.
// Private alan olması için başlarına _ getiriliyor 
