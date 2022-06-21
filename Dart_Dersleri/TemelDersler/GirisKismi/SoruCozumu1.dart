import 'dart:math';

main(List<String> args) {
  // 1.soru :
  List<String> sehirler = [];
  sehirler.add("Ankara");
  sehirler.add("Samsun");
  sehirler.add("Muğla");
  sehirler.add("Kırşehir");
  for (int i = 0; i < sehirler.length; i++) {
    print(sehirler[i]);
  }
  print("*************");
  // 2.soru :
  Map<String, dynamic> pco = {"Çekirdek": 6, "RAM": 8, "SSD": 256};
  print(pco);
  print("*************");

  // 3.soru :
  List<Map<String, dynamic>> iller = <Map<String, dynamic>>[];
  var ekleneceksehir1 = <String, dynamic>{};
  ekleneceksehir1["Il_adi"] = "Ankara";
  ekleneceksehir1["Ilce_Sayisi"] = 12;
  ekleneceksehir1["Plaka_Kodu"] = 06;
  var ekleneceksehir2 = <String, dynamic>{};
  ekleneceksehir2["Il_adi"] = "Samsun";
  ekleneceksehir2["Ilce_Sayisi"] = 8;
  ekleneceksehir2["Plaka_Kodu"] = 55;
  var ekleneceksehir3 = <String, dynamic>{};
  ekleneceksehir3["Il_adi"] = "Muğla";
  ekleneceksehir3["Ilce_Sayisi"] = 6;
  ekleneceksehir3["Plaka_Kodu"] = 48;
  iller.add(ekleneceksehir1);
  iller.add(ekleneceksehir2);
  iller.add(ekleneceksehir3);

  // Muğlanın plaka kodunu göster.
  print(iller[2]["Plaka_Kodu"]);

  for (int i = 0; i < iller.length; i++) {
    var oankiSehirMapyapisi = iller[i];
    print(
        "${i + 1} . Şehir Bilgisi : ${oankiSehirMapyapisi["Il_adi"]}, ${oankiSehirMapyapisi["Ilce_Sayisi"]}, ${oankiSehirMapyapisi["Plaka_Kodu"]}");
  }
  print("*************");

  // 4.soru :
  List<int> l1 = List.filled(5, 0);
  List<int> l2 = List.filled(5, 0);

  for (int i = 0; i < 5; i++) {
    l1[i] = Random().nextInt(50);
    l2[i] = Random().nextInt(50);
  }

  var lbirlesim = [...l1, ...l2];

  var sonSet = <int>{};
  for (int gecici in lbirlesim) {
    sonSet.add(gecici * gecici);
  }
  print(lbirlesim);
  print(sonSet);
}
