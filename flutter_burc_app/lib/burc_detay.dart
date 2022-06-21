import 'package:flutter/material.dart';
import 'package:flutter_burc_app/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burclar secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.orange;
  // palattegenerator import edildi internetden pubspec e yolu belirtildi.
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();
    appBarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appBarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.secilenBurc.burcAdi + ' Burcu Ve Özellikleri',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              background: Image.asset(
                'assets/images/' + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.cyan[50],
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetayi,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage('assets/images/${widget.secilenBurc.burcBuyukResim}'),
    );
    setState(() {
      appBarRengi = _generator.dominantColor!.color;
    });
  }
}
