/*
  Lambda : ismi olmayan fonksiyonlardır. Dartta her fonksiyon aslında birer nesnedir.
*/

main(List<String> args) {
  // Ismı olmayan fonksiyon.
  Function fonksiyon1 = (int a, int b) {
    int toplam = a + b;
    print(toplam);
  };

  fonksiyon1(5, 10);

  var fonksiyon2 = (int x, int y) => x * x + y * y;
  // üstde ki kullanım daha kolay.
  var fonksiyon3 = (int z) {
    return z * z;
  };

  print(fonksiyon2(4, 5));
  var sayi = fonksiyon3(8);
  print(sayi);
}

// Burda fonksiyonun ismi var ismi de : sayilariTopla
void sayilariTopla(int a, int b) {
  int toplam = a + b;
  print(toplam);
}
