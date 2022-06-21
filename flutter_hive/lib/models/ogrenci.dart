import 'package:hive/hive.dart';
// bu part kısmı flutter packages pub run build_runner build çalıştırılması sonucu elde edildi ve eklendi.
part 'ogrenci.g.dart';

// kaydedilmek istenen class için hivetype
// kaydedilmek istenen veri için hivefield
@HiveType(typeId: 1)
class Ogrenci {
  @HiveField(
    0, /*defaultValue: 222*/
  )
  final int ogrid;
  @HiveField(1)
  final String ograd;
  @HiveField(2)
  final GozRenk gozRenk;

  Ogrenci(this.ogrid, this.ograd, this.gozRenk);

  @override
  String toString() {
    // verileri yazdırabilmek için toString.
    return '$ogrid - $ograd-  $gozRenk';
  }
}

@HiveType(typeId: 2)
enum GozRenk {
  @HiveField(0)
  mavi,
  @HiveField(1)
  siyah,
  @HiveField(2)
  yesil,
  @HiveField(3)
  kahverengi,
}
