class OgrenciCozum {
  int id;
  int not;

  // isimlendirilmiş parametre verebilmek için _ olmadan değişken verilmeli.
  OgrenciCozum({this.id = 1, this.not = 1}); // varsayılan olarak 1 aldırdık.

  @override
  String toString() {
    // hem id hem not u yazdırabilmek için kullanıyoruz.
    return "Öğrenci id : $id , öğrenci not : $not";
  }
}
