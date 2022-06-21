main(List<String> args) {
  // Böyle yapılmasının amacı list kullanırken en büyük sınıf alındığı için.
  // db2 oluşturulurken fazla değişiklik yapmanın önüne geçer.
  VeriTabani db = OracleDB();
  VeriTabani db2 = FireBase();

  db.guncelle();
  db.kaydet();

  userSil(db);
  userSil(db2);
}

void userSil(VeriTabani veritabani) {
  veritabani.sil();
}

abstract class VeriTabani {
  void kaydet();
  void guncelle();
  void sil();
}

class OracleDB extends VeriTabani {
  @override
  void guncelle() {
    print("ODB Güncellendi.");
  }

  @override
  void kaydet() {
    print("ODB Kaydedildi.");
  }

  @override
  void sil() {
    print("ODB Silindi.");
  }
}

class FireBase extends VeriTabani {
  @override
  void guncelle() {
    print("FB Güncellendi.");
  }

  @override
  void kaydet() {
    print("FB Kaydedildi.");
  }

  @override
  void sil() {
    print("FB Silindi.");
  }
}
