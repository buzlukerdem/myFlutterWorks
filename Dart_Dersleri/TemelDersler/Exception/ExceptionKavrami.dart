/* Olası istisna durumlarında kullanılır.*/
// try catch kullanılır.
main(List<String> args) {
  print("Program Basladi.");

  try {
    int sayi = 100 ~/ 0;
    //int sayi2 = 50 ~/ int.parse("erdem"); burası satır 13,14,15 için di

    //  hatanın adını bildigimiz için.
  } on IntegerDivisionByZeroException {
    print("Bölen 0 olamaz.");
  } on FormatException catch (e) {
    print(e.message);
    print(e.source);
  } catch (e) {
    // hata çıkınca çalışacak kısım.
    print("Hata cikti : ${e}");
  } finally {
    // hata çıksın ya da çıkmasın burası her türlü çalışır.
    print("Islem bitti.");
  }
  print("Program bitti.");
}
