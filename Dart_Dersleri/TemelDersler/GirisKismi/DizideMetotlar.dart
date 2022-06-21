main(List<String> args) {
  List<int> sayilar = [1, 4, 7, 22, 11, 6, 17];
  print("Sayıların eleman sayısı : ${sayilar.length}");
  print("1.eleman : ${sayilar.first}");
  print("Sonuncu eleman : ${sayilar.last}");
  print("Dizi boş mu ? ${sayilar.isEmpty}");
  print(sayilar);
  sayilar.add(25); // 25 ekle
  sayilar.remove(4); // 4ü kaldır
  print(sayilar);
  print("Ters sırada yazır : ${sayilar.reversed}");
  sayilar.removeAt(4); //4.idexdeki sayıyı kaldır(22);
  print(sayilar);
  //  sayilar.clear();
  if (sayilar.contains(17)) {
    print("Listede 17 sayısı var");
  } else {
    print("Listede 17 sayısı yok");
  }

  print(sayilar.elementAt(5)); // 5.index de ki sayıyı ver.
  print(sayilar.indexOf(11)); //  11 sayısının index numarasını ver.
  sayilar.shuffle(); // Dizi içerisindeki sayıların yerlerini değiştirir.Random.
  print(sayilar);
}
