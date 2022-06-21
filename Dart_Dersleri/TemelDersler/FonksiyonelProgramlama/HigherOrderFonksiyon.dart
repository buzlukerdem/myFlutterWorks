/*
  Higher order fonksiyonları : bir fonksiyonu parametre olarak alan veya geriye
  fonksiyon döndüren fonksiyonlardır.
  İkisi aynı anda da yapılabilir. 
*/

main(List<String> args) {
  List<int> liste = [1, 2, 3];
  /*liste.forEach((element) {
    print("Elemanlar : $element");
  });
  */
  //2.yol bu da
  liste.forEach(callBack);

  kendiForeachYapim(liste, (int deger, int index) {
    print("Değer : $deger ve index : $index");
  });
}

//kendi foreach yapımızı yapalım.
void kendiForeachYapim(List<int> liste, Function callBack) {
  for (int i = 0; i < liste.length; i++) {
    callBack(liste[i], i);
  }
}

void callBack(int element) {
  print("Elemanlar : $element");
}
