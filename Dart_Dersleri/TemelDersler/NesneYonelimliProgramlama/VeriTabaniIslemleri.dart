import 'dart:math';

class VeriTabaniIslemleri {
  String _kullaniciadi = "admin";
  String _sifre = "123";

  bool baglan() {
    if (_internetVarMi()) {
      if (_kullaniciadi == "admin" && _sifre == "123") {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool _internetVarMi() {
    if (Random().nextBool()) {
      return true;
    } else
      return false;
  }

  VeriTabaniIslemleri() {}
  VeriTabaniIslemleri.LoginWithinUsernameAndPassowrd(
      String kullaniciadi, String sifre) {}
}
