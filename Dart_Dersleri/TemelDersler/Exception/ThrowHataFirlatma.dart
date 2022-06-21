import 'dart:math';

main(List<String> args) {
  try {
    double deger = karekokunuAl(-5);
    // toStringAsFixed : virgülden sonra kaç sayı göstermesini sağlar.
    print("Deger : ${deger.toStringAsFixed(2)}");
  } on FormatException catch (e) {
    print(e.message);
  } catch (e) {
    print(e);
  }
}

double karekokunuAl(double i) {
  if (i < 0) {
    throw FormatException("Sayi negatif olamaz.");
  } else {
    return sqrt(i);
  }
}
