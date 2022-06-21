import 'package:flutter/material.dart';
import 'package:flutter_burc_app/burc_item.dart';
import 'package:flutter_burc_app/data/strings.dart';
import 'package:flutter_burc_app/model/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<Burclar> tumBurclar;
  BurcListesi() {
    tumBurclar = veriKaynaginiHazira();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burçlar Uygulamam'),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return BurcItem(listeBurc: tumBurclar[index]);
        },
        itemCount: tumBurclar.length,
      )),
    );
  }

  List<Burclar> veriKaynaginiHazira() {
    List<Burclar> gecici = [];

    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      // kücük resim i elde etmek için lowercase çevirim.
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      // büyük resim için de aynı.
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i + 1}.png';
      Burclar eklenecekBurc = Burclar(
          burcAdi, burcTarih, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
