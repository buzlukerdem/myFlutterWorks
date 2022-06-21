// required kullanıldığında mutlaka değer girilmesi istenir.

int ucSayiyiTopla(
    {required int ilk, required int ikinci, required int ucuncu}) {
  return ilk + ikinci + ucuncu;
}

main(List<String> args) {
  final toplam = ucSayiyiTopla(ilk: 4, ikinci: 5, ucuncu: 6);
  try {
    print(karakterSayisiBul(null));
  } catch (e) {
    print(e);
  }
}

int karakterSayisiBul(String? mesaj) {
  if (mesaj == null) {
    // koşul kurtarıcı oluyor.
    throw Exception("Mesaj null olamaz.");
  }
  return mesaj.length;
}
