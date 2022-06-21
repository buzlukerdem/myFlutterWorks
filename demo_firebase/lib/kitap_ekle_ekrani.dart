import 'dart:io';
import 'package:demo_firebase/kitapligim.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class KitapEkle extends StatefulWidget {
  KitapEkle({Key? key}) : super(key: key);

  @override
  _KitapEkleState createState() => _KitapEkleState();
}

class _KitapEkleState extends State<KitapEkle> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  DateTime? _myDateTime;
  String time = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('KİTAP EKLEME EKRANI'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
        titleTextStyle: TextStyle(fontSize: 22),
      ),
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  Container(
                      child: image != null
                          ? Image.file(
                              image!,
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            )
                          : FlutterLogo(
                              size: 160,
                            )),
                  Divider(
                    indent: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 3, 25, 3),
                    child: TextField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.auto_stories_sharp,
                            color: Colors.white,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Kitap Adı:',
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 3, 25, 3),
                    child: TextField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person_pin_circle_rounded,
                            color: Colors.white,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Kitap Yazarı:',
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Kitabın Alınma Tarihini Seçin :',
                        style: TextStyle(
                            fontSize: 18, backgroundColor: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, onPrimary: Colors.black),
                        onPressed: () async {
                          _myDateTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2030));

                          setState(() {
                            final now = DateTime.now();

                            time = _myDateTime.toString();
                          });
                        },
                        child: Text(
                          'Tarih Seç',
                        ),
                      )
                    ],
                  ),
                  Text(
                    // Tarihi  yazdırdığımız text
                    time,
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () => pickImage(),
                    child: Text('Kamera dan resim seç'),
                  ),
                  RaisedButton(
                      color: Colors.white,
                      child: Text('Kitabı Ekle'),
                      onPressed: () {}),
                  RaisedButton(
                      color: Colors.white,
                      child: Text('Kitaplığım Sayfasına Git'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KitapligimSayfasi()));
                      }),
                  RaisedButton(
                    child: Text('GERİ DÖN'),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                      //Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

/*
child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                    radius: 30,
                  ),
*/