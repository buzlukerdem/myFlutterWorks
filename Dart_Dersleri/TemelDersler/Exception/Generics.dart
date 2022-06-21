/* Dart optionally type bir dildir(Veri tiplerini belirtmek isteğe bağlıdır.)
  Sürekli kullanılan koleksiyon yapıları : set,map,list varsayılan olarak heterojendir
  
  Generic tip sayesinde bir yapıda hangi tür verilerin olacağını söyleriz.
  Böylece bu yapılar typce-safe olur. Compile edilirken hata olursa bize söyler.
  Böylece runtime da çıkacak hatanın önüne geçmiş oluruz.
  
  Genericler <> içinde belirtilirler.

*/
main(List<String> args) {
  List<String> liste = [];
  liste.add("Erdem");
  liste.add("Buzluk");
  yazir(liste);
}

yazir(List list) {
  print(list[0].length);
}
