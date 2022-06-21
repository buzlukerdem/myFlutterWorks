import 'package:demo_firebase/kitap_ekle_ekrani.dart';
import 'package:flutter/material.dart';

class GirisEkrani extends StatefulWidget {
  GirisEkrani({Key? key}) : super(key: key);

  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController mailController = TextEditingController();
  TextEditingController sifreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('GİRİŞ EKRANI'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
        titleTextStyle: TextStyle(fontSize: 22),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/login.jpg'),
              Divider(
                indent: 40,
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 3, 25, 3),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Mailinizi Girin:',
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 3, 25, 3),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Şifrenizi Girin:',
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                indent: 40,
              ),
              RaisedButton(
                color: Colors.white,
                child: Text('GİRİŞ YAP'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => KitapEkle()));
                },
              ),
              RaisedButton(
                child: Text('GERİ DÖN'),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
