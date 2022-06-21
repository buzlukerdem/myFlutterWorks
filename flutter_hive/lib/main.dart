import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hive/models/ogrenci.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

// hive : telefonlarda ki veritabanları uygulamada email şifre gibi verilerin
// tutulmasını sağlar. Box'lar tablo gibi işlev görür.
Future<void> main() async {
  // bunun işlevi aşağıdaki işlemler bittikten sonra flutter ağacını oluşturur.
  WidgetsFlutterBinding.ensureInitialized();

  // çalışmadan önce box , hive.initFlutter dememiz gerekiyor.
  await Hive.initFlutter('uygulama');

  // kutuya verileri şifreleyerek koyuyor. şifreleme için securestorage kullanıldı.
  // encrypted
  const secureStorage = FlutterSecureStorage();

  // bu key değeri securestorage de yoksa hive ile securekey üretiliyor.
  var encryprionKey = await secureStorage.containsKey(key: 'key');
  if (!encryprionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(
      key: 'key',
      value: base64UrlEncode(key),
    );
  }
  // key değerini decode ederek byte lara dönüştürüldü
  var encryptionKey =
      base64Url.decode(await secureStorage.read(key: 'key') ?? '');
  print('Encryption key: $encryptionKey');
  var sifreliKutu = await Hive.openBox('ozel',
      encryptionCipher: HiveAesCipher(encryptionKey));
  await sifreliKutu.put('secret', 'Hive is cool');
  await sifreliKutu.put('password', '123456');

  print(sifreliKutu.get('secret'));
  print(sifreliKutu.get('password'));

  /***/

  await Hive.initFlutter('uygulama');
  await Hive.openBox('test');
  //kutuyu açmadan önce ogrencisınıfının  ve Gozrenk adapter i kaydedildi.
  Hive.registerAdapter(OgrenciAdapter());
  Hive.registerAdapter(GozRenkAdapter());
  await Hive.openBox<Ogrenci>('ogrenciler');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    // adı test olan box ı aç.
    var box = Hive.box('test');
    await box.clear();
    // add kullanımı async değildir await içermez.
    box.add('Erdem'); // key değerini kendi atıyor 0 , 1 ,2 gibi.
    box.add('Buzluk');
    box.add(1907);
    // await box.addAll(['Ankara', 1998]);

    // put kullanımı async dir await içerir.
    await box.put('cinsiyet', 'erkek');
    await box.put('bolum', 'Bilgisayar mühendisligi');
    //  await box.putAll({'araba': 'Mercedes', 'km': '150432'});

    // await box.delete('cinsiyet');
    // await box.deleteAt(0);
    // await box.putAt(1, 'yenideger'); yeni deger ataması yapar.

    // box.values.forEach((element) {
    //   debugPrint(element.toString());
    // });

    debugPrint(box.toMap().toString());
    debugPrint(box.get('bolum')); // key ile erişim
    debugPrint(box.getAt(2).toString()); // index ile erişim
  }

  void _customData() async {
    var ogrenci1 = Ogrenci(1, 'erdem', GozRenk.kahverengi);
    var ogrenci2 = Ogrenci(2, 'sabri', GozRenk.siyah);

    var box = Hive.box<Ogrenci>('ogrenciler');
    await box.clear();
    await box.put('ogrenci-1', ogrenci1);
    await box.put('ogrenci-2', ogrenci2);

    debugPrint(box.toMap().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _customData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
