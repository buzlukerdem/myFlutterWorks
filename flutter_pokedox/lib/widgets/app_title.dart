import 'package:flutter/material.dart';
import 'package:flutter_pokedox/constants/constants.dart';
import 'package:flutter_pokedox/constants/ui_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitle extends StatefulWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  @override
  Widget build(BuildContext context) {
    String imageYol = 'assets/images/pokemonball.jpg';
    // position ve align widget kullanılıyosa üst ü STACK dir
    return SizedBox(
      height: UIHelper.getAppTitleHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPaddig(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Sabitler.title,
                style: Sabitler.baslikTextStyle(),
              ),
            ),
          ),
          Align(
            child: Image.asset(
              imageYol,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.contain,
            ),
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }
}
