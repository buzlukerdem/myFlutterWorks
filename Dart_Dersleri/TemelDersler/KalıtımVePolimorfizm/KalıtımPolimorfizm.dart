main(List<String> args) {
  Userlar user1 = Userlar();
  user1.girisYap();
  var user2 = NormalUser();
  user2.girisYap();
  SadeceOkuyabilenUser user3 = SadeceOkuyabilenUser();
  user3.girisYap();
  print("*************");
  //upcastin yukarı çevrim
  Userlar user4 = SadeceOkuyabilenUser(); //Alt sınıfdan Üstü sınıfa erişilir.

  // tek bi çatı altında toplama.
  List<Userlar> tumUserlar = [];
  tumUserlar.add(user1);
  tumUserlar.add(user2);
  tumUserlar.add(user3);

  test(user1);
  test(user2);
  test(user3);
  test(user4);
}

void test(Userlar kullanicilar) {
  kullanicilar.girisYap(); // Poliformiz çok biçimlilik.
}

class Userlar {
  String email = "";
  String password = "";

  void girisYap() {
    print("Kullanıcı giriş yaptı.");
  }
}

class NormalUser extends Userlar {
  void davetEt() {
    print("Davet gönderildi.");
  }

// Üst sınıfı olan Userlar da yazan Kullanıcı giriş yaptı yı ezdi.
  @override
  void girisYap() {
    print("Normal User giriş yaptı.");
  }
}

class SadeceOkuyabilenUser extends NormalUser {
  void adiniSoyle() {
    print("Sadece okuma yapabilirim");
  }

  // Üst sınıfı olan NormalUser da yazan Normal User giriş yaptı yı ezdi.
  @override
  void girisYap() {
    print("Sadeceokuyabilen giriş yaptı.");
  }
}

class AdminUser extends Userlar {
  @override
  void girisYap() {
    print("Admin User giriş yaptı.");
  }

  void toplamKullaniciSayisiniGoster() {
    print("Toplam kullanıcı sayısı : 30");
  }
}
