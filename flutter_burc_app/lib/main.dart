import 'package:flutter/material.dart';
import 'package:flutter_burc_app/burclistesi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      title: 'Material App',
      home: BurcListesi(),
    );
  }
}
