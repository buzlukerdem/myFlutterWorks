/*CemberDaire adında bir sınıf oluşturun. Bu sınıfın yarıçap alan kurucusu olmalı.
  ayrıca cevre ve alan hesaplayan metotlar olmalı (pi:3,14) alın.

*/
import 'CemberDaire.dart';

main(List<String> args) {
  // Soru 1 çözümü
  CemberDaire c1 = CemberDaire(3);
  print("Çevre sonucu : ${c1.cevreHesapla()}");
  print("Alan sonucu : ${c1.alanHesapla()}");
}
