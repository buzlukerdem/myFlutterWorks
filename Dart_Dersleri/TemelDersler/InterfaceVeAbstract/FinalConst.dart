/* Immutable değişmez demek 
 instance değişkenler final olarak tanımlanır. Const ile tanımlanması için
 static const olarak tanımlanması gerekir.
 Final ile var aynı anda kullanılmaz.
 */
main(List<String> args) {
  // final String n = "Erdem";
  // const String s = "Buzluk";

  /*Final: Değer atandıktan sonra, bellekte yer ayrılması sadece erişilirse olur.
    Const: Bu da aslında Final'dır ama derleme anında değer atanır ve bellekte yeri ayrılır, hiç kullanılmasa bile.
    Const : Çalışmadan önce değeri bilinen elemanları kapsar. Constlar ın hepsi aynı şeyi gösterir.
  */

  /* Farkları arasında örnek.
  final tarih = DateTime.now();
  const tarih = Datetime.now();  hata veriyor.*/

  final liste = [1, 2, 3];
  final liste2 = [1, 2, 3];

  // liste.add(4);  Adres yeri değişmediği için final üzerinden listeye ekleme yapılabilir.

  if (liste == liste2) {
    print("Esit");
  } else {
    print("Esit değil"); // bellek adresi farklı olduğu için esit değil çalısır.
  }

  // canonicalized , const bellek dostudur
  const liste3 = [4, 5, 6];
  const liste4 = [4, 5, 6];

  // liste3.add(4); Listeye ekleme yapılamıyor.

  if (liste3 == liste4) {
    print("Eşittt");
  } else {
    print("Eşşşitt değil");
  }
}
