import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sabitler {
  Sabitler._const();

  static const String title = 'POKEDEX';

  static TextStyle baslikTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(32),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle pokemonNameTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle labelTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 1.4).sp;
    }
  }

  static TextStyle informationtextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }
}
