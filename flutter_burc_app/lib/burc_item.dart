import 'package:flutter/material.dart';
import 'package:flutter_burc_app/burc_detay.dart';
import 'package:flutter_burc_app/model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burclar listeBurc;
  const BurcItem({required this.listeBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BurcDetay(secilenBurc: listeBurc),
            ),
          );
        },
        leading: Image.asset(
          "assets/images/" + listeBurc.burcKucukResim,
        ),
        title: Text(
          listeBurc.burcAdi,
          style: myTextStyle.headline5,
        ),
        subtitle: Text(
          listeBurc.burcTarihi,
          style: myTextStyle.subtitle1,
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: Colors.orange.shade700,
        ),
      ),
    );
  }
}
