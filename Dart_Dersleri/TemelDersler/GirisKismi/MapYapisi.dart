// Elemanalr key-value olarak saklanır.
main(List<String> args) {
  Map<String, int> alanKodlari = {"Ankara": 312, "İstanbul": 212, "Bursa": 224};
  print(alanKodlari);
  print(alanKodlari["Ankara"]);

  Map<String, dynamic> bilgi = {
    "isim": "erdem",
    "soyisim": "buzluk",
    "yas": 23,
    "bekarMi": true
  };
// 2.map oluşturma yolu
  Map<String, dynamic> deneme = Map();
  deneme["Okul"] = "OMU";
  print(deneme);
  print("**************");
  print(bilgi);
  print(bilgi["yas"]);

  for (var deger in bilgi.entries) {
    //bilgi.key , bilgi.value da örnekler.
    print("Key : ${deger.key} , Value : ${deger.value} ");
  }
}
