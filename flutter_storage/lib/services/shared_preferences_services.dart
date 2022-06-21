import 'package:flutter_storage/model/my_models.dart';
import 'package:flutter_storage/services/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferanceService implements LocalStorage {
  late final SharedPreferences preferences;
  SharedPreferanceService() {}

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> verileriKaydet(UserInformation userInformation) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString('isim', userInformation.isim);
    preferences.setBool('ogrenci', userInformation.ogrenciMi);
    preferences.setInt('cinsiyet', userInformation.cinsiyet.index);
    preferences.setStringList('renkler', userInformation.renkler);
  }

  Future<UserInformation> verileriOku() async {
    var _isim = preferences.getString('isim') ?? ' ';
    var _ogrenciMi = preferences.getBool('ogrenci') ?? true;
    var _cinsiyet = Cinsiyet.values[preferences.getInt('cinsiyet') ?? 1];
    var _renkler = preferences.getStringList('renkler') ?? [];
    return UserInformation(_isim, _cinsiyet, _renkler, _ogrenciMi);
  }
}
