// SabitBoyutlu dizilerde değer ataması yapılabilir dizilere.
// DinamikBoyutlu da ise ekleme yapılır growable : true denerek
main(List<String> args) {
  // List<int> sayilarrr = List.empty(growable: true); altdaki ile aynı anlamda
  List<int> sayilar = [];
  sayilar.add(15);
  sayilar.add(45);
  print(sayilar);

  List<int> sayilar2 = [1, 2, 3, 4, 5];
  print(sayilar2);

  List<int> sayilar3 = List.filled(3, 9, growable: true);
  sayilar3.add(30);
  print(sayilar3);
  print("Sayilar3 ün boyutu : " + sayilar3.length.toString());
}
