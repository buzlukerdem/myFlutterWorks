main(List<String> args) {
  var mySet = {'erdem', 'buzluk'}; // var bunu set olarak algılıyor.
  var myMap = {'Yas': 23}; // var bunu map olarak algılıyor.
  var tekSayilar = [1, 3, 5, 7, 9]; // var bunu list<int> olarak algılıyor.
  var ciftSayilar = [2, 4, 6, 8, 10];

// spreads operator (birleştiricidir).
  var listem = [...tekSayilar, ...ciftSayilar];
  print(listem);
  print(myMap);
  print(mySet);
}
