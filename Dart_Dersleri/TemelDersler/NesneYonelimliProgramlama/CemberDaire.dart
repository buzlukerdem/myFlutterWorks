class CemberDaire {
  int _r = 1;
  double _pi = 3.14;

  CemberDaire(int yaricap) {
    _yaricapKontrol = yaricap;
  }

  void set _yaricapKontrol(int deger) {
    if (deger >= 0) {
      _r = deger;
    } else {
      _r = 1;
    }
  }

  double cevreHesapla() {
    return 2 * _pi * _r;
  }

  double alanHesapla() {
    return _pi * _r * _r;
  }
}
