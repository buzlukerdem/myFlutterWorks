// await kullanılıyorsa fonksiyonun baş kısmına async komutu da yazılır.
main(List<String> args) async {
  print("İnternetden kişi verisi getirilecek.");
  kisiIslemler();
  print("Yapılacak diğer işlemler.");
  print("İşlem bitti.");
}

void kisiIslemler() async {
  String kisi = await kisiVerisiniGetir();
  print("Kişinin lenghti : ${kisi.length}");
}

Future<String> kisiVerisiniGetir() {
  return Future<String>.delayed(Duration(seconds: 3), () {
    return "Kişi adı : Erdem , id : 19921";
  });
}
