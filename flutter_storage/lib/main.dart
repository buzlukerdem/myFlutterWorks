import 'package:flutter/material.dart';
import 'package:flutter_storage/services/file_storage.dart';
import 'package:flutter_storage/services/local_storage.dart';
import 'package:flutter_storage/services/secure_storage.dart';
import 'package:flutter_storage/shared_api.dart';
import 'package:get_it/get_it.dart';

// tüm değişikligi burda yapabiliriz. Secure, file, shared hangisi kullanılacaksa.
final getIt = GetIt.instance;

void setup() {
  //filestorage zort.
  getIt.registerSingleton<LocalStorage>(SecureStorage());
}

void main() {
  // program çalışmadan uzun süren işlemler ayarlanmasını sağlıyor.
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}
// UYGULAMA KAPANDIGINDA VERİLERİN SİLİNMEMESİ İÇİN SharedPreference...

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Storage Islemleri'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SharedPage()),
                );
              },
              child: const Text('Shared Preference / Secure Storage Kullanımı'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
