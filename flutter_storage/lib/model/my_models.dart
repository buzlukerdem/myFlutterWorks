// class dan daha küçük veriler için okunabilrlik ve yazım yanlışı azaltmak için.
// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

enum Cinsiyet {
  KADIN,
  ERKEK,
  DIGER,
}

enum Renkler {
  SARI,
  LACIVERT,
  YESIL,
  TURUNCU,
  KIRMIZI,
  MOR,
}

class UserInformation {
  final String isim;
  final Cinsiyet cinsiyet;
  final List<String> renkler;
  final bool ogrenciMi;

  UserInformation(this.isim, this.cinsiyet, this.renkler, this.ogrenciMi);

  // json formatına döndürüyoruz.
  Map<String, dynamic> toJson() {
    return {
      'isim': isim,
      'cinsiyet': describeEnum(cinsiyet),
      'renkler': renkler,
      'ogrenciMi': ogrenciMi,
    };
  }

  UserInformation.fromJson(Map<String, dynamic> json)
      : isim = json['isim'],
        cinsiyet = Cinsiyet.values.firstWhere(
            (element) => describeEnum(element).toString() == ['cinsiyet']),
        renkler = List<String>.from(json['renkler']),
        ogrenciMi = json['ogrenciMi'];
}
