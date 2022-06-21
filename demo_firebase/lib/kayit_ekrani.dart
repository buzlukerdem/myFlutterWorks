import 'package:demo_firebase/giris_ekrani.dart';
import 'package:flutter/material.dart';

class KayitlanmaEkrani extends StatefulWidget {
  KayitlanmaEkrani({Key? key}) : super(key: key);

  @override
  _KayitlanmaEkraniiState createState() => _KayitlanmaEkraniiState();
}

class _KayitlanmaEkraniiState extends State<KayitlanmaEkrani> {
  TextEditingController mailController = TextEditingController();
  TextEditingController sifreController = TextEditingController();
  TextEditingController isimController = TextEditingController();
  TextEditingController soyisimController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('KAYITLANMA EKRANI'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
        titleTextStyle: TextStyle(fontSize: 22),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/signup.png'),
              Divider(
                indent: 40,
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 3, 25, 3),
                      child: TextField(
                        controller: isimController,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.account_box_outlined,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Adınızı Girin:',
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 3, 25, 3),
                      child: TextField(
                        controller: soyisimController,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.account_box_rounded,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Soyadınızı Girin:',
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 3, 25, 3),
                      child: TextField(
                        controller: mailController,
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
                        controller: sifreController,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Şifrenizi Oluşturun:',
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
                child: Text('KAYIT OL'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GirisEkrani()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
