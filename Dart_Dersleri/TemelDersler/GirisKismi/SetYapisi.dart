/*List yapısından farklıdır.
Sıralı tutulmaz, bir eleman sadece bir tane olur.
Yani her eleman birbirinden farklıdır.
eleman kontrolü contains ile yapılır.
*/
main(List<String> args) {
  Set<String> isimler = Set();
  isimler.add("Hakan");
  isimler.add("Bilal");
  isimler.add("Hakan");
  isimler.add("Hakan");
  isimler.add("Başak");
  isimler.add("Canan");
  isimler.add("Simay");

  for (String x in isimler) {
    print(x);
  }
  bool sonuc = isimler.contains("Başak");
  print(sonuc);
  print("**********************");
  Set<int> sayilar = Set.from([1, 4, 4, 2, 3, 5, 6, 6, 1, 2, 3, 3, 1, 1, 1]);

  for (int y in sayilar) {
    print(y);
  }
  Set<int> ciftsayilar = Set.from([0, 2, 4, 6, 8, 10]);
  sayilar.addAll(ciftsayilar);
  print(sayilar);
}
