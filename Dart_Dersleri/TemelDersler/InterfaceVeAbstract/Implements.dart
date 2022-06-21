/* -Dart dilinde interface diye bi kavram yok.
  - Ama sınıflar implements kelimesi ile interface gibi kullanılabilirler.
  - Interface ler sayesinde ortak özelliği olan ancak kalıtımsal olarak
  alakalı olmayan sınıfları bir çatı altında toplayabiliriz.
  - Interace olarak kullanılan sınıfların methodları bu sınıfları implemente
  eden sınıflar tarafından yapılmak zorundadur.
  - Çoklu kalıtım sağlama özelliği vardır. Bir sınıf birden fazla sınıf implement
  edebilir.
*/
main(List<String> args) {}

abstract class Hayvan {}

abstract class Havacil {
  void fly();
  void test() {
    print("Test");
  }
}

abstract class Karacil {
  void run();
}

abstract class Denizcil {
  void swim();
}

// implement edildi 2 sınıfdan ortak verileri olduğu için extends kullanılmadı.
// Her timsah bir hayvandır ayrıca karacıl ve denizcildir.
class Timsah extends Hayvan implements Karacil, Denizcil {
  @override
  void run() {
    print("Timsah koşar.");
  }

  @override
  void swim() {
    print("Timsah yüzer.");
  }
}

// illa extends olacka diye bişey yok. İnsan hayvan değildir ayrıca
class Insan implements Karacil {
  @override
  void run() {
    print("Insan koşar.");
  }
}

// implement ettiğimiz Havacil da olan test i kullanmamız şart.
class Kus extends Hayvan implements Havacil {
  @override
  void fly() {
    print("Kuş uçar.");
  }

  @override
  void test() {
    print("Test çalışır.");
  }
}
