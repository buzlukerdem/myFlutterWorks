import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_storage/model/my_models.dart';
import 'package:flutter_storage/services/local_storage.dart';

/* FlutterSecureStorage şifreleme için ideal bir preference 
   Telefonda kullancı uygulamayı tekrar açarken şifresini tekrar girmeden
   ekrana getirilmesinde faydası var.
   SharedPreference e göre daha kullanışlı.
 */

class SecureStorage implements LocalStorage {
  late final FlutterSecureStorage preferences;

  SecureStorage() {
    debugPrint('kurucu calıstı.');
    preferences = FlutterSecureStorage();
  }

  Future<void> verileriKaydet(UserInformation userinformation) async {
    await preferences.write(key: 'isim', value: userinformation.isim);
    await preferences.write(
        key: 'cinsiyet', value: userinformation.cinsiyet.index.toString());
    // renkler String list oldugu için jsonEncode
    await preferences.write(
        key: 'renkler', value: jsonEncode(userinformation.renkler));
    await preferences.write(
        key: 'ogrenci', value: userinformation.ogrenciMi.toString());
  }

  Future<UserInformation> verileriOku() async {
    var _isim = await preferences.read(key: 'isim') ?? '';
    var _ogrenciString = await preferences.read(key: 'ogrenci') ?? 'false';
    var _ogrenci = _ogrenciString.toLowerCase() == 'true' ? true : false;
    var _cinsiyetString = await preferences.read(key: 'cinsiyet') ?? '0';
    var _cinsiyet = Cinsiyet.values[int.parse(_cinsiyetString)];
    var _renklerString = await preferences.read(key: 'renkler');
    var _renkler = _renklerString == null
        ? <String>[]
        : List<String>.from(jsonDecode(_renklerString));

    return UserInformation(_isim, _cinsiyet, _renkler, _ogrenci);
  }
}
