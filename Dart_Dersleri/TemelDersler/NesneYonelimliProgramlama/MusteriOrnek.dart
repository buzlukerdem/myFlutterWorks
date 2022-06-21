class Musteri {
  int? _musteriNo;

  // Musteri(this.musteriNo);
  /*Musteri(int musterino) {
    this.musteriNo = musterino;
  }
  */

// kurucu metot çalıştı demek yerine musterino kontrol ediyoruz.
  Musteri(int musteriNoooo) {
    _musterinoKontrol(musteriNoooo);
  }

  void _musterinoKontrol(int no) {
    if (no >= 1) {
      _musteriNo = no;
    } else {
      return;
    }
  }

  String get musteriNoSoyle {
    return "Musteri noo : $_musteriNo";
  }

  void set musteriNoAta(int no) {
    if (no >= 1) {
      _musteriNo = no;
    } else {
      return;
    }
  }

  void bilgileriYazdir() {
    print("Musteri no : $_musteriNo");
  }
}
