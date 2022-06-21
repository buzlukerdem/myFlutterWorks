import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_storage/main.dart';
import 'package:flutter_storage/model/my_models.dart';
import 'package:flutter_storage/services/local_storage.dart';

class SharedPage extends StatefulWidget {
  SharedPage({Key? key}) : super(key: key);

  @override
  State<SharedPage> createState() => _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {
  var _secilenCinsiyet = Cinsiyet.DIGER;
  var _secilenRenkler = <String>[];
  var _ogrenciMisin = false;

  TextEditingController _namecontroller = TextEditingController();

  final LocalStorage _preferenceService = getIt<LocalStorage>();

  @override
  void initState() {
    super.initState();
    _verileriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Kullanımı'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _namecontroller,
              decoration: InputDecoration(
                labelText: 'Adınızı Girin.',
              ),
            ),
          ),
          for (var item in Cinsiyet.values)
            _getRadioListTiles(describeEnum(item), item),
          for (var item in Renkler.values) _getCheckboxListTile(item),
          SwitchListTile(
            title: Text('Öğrenci misin ?'),
            value: _ogrenciMisin,
            onChanged: (bool ogrenciMi) {
              setState(() {
                _ogrenciMisin = ogrenciMi;
              });
            },
          ),
          TextButton(
              onPressed: () {
                var _userInformation = UserInformation(_namecontroller.text,
                    _secilenCinsiyet, _secilenRenkler, _ogrenciMisin);
                _preferenceService.verileriKaydet(_userInformation);
              },
              child: Text('Gönder'))
        ],
      ),
    );
  }

  CheckboxListTile _getCheckboxListTile(Renkler renk) {
    return CheckboxListTile(
        title: Text(describeEnum(renk)),
        value: _secilenRenkler.contains(describeEnum(renk)),
        onChanged: (bool? deger) {
          if (deger == false) {
            _secilenRenkler.remove(
              describeEnum(renk),
            );
          } else {
            _secilenRenkler.add(describeEnum(renk));
          }
          setState(() {});
        });
  }

  Widget _getRadioListTiles(String title, Cinsiyet cinsiyet) {
    return RadioListTile(
        title: Text(title),
        value: cinsiyet,
        groupValue: _secilenCinsiyet,
        onChanged: (Cinsiyet? secilmisCinsiyet) {
          setState(
            () {
              _secilenCinsiyet = secilmisCinsiyet!;
            },
          );
        });
  }

  void _verileriOku() async {
    var info = await _preferenceService.verileriOku();
    _namecontroller.text = info.isim;
    _ogrenciMisin = info.ogrenciMi;
    _secilenCinsiyet = info.cinsiyet;
    _secilenRenkler = info.renkler;
    setState(() {});
  }
}
