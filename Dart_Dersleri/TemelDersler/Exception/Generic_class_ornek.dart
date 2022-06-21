// yığın stack yapısı üzerinden yapılacak.
// ilk giren eleman en son çıkar.
// PUSH : eleman ekleme olayı push ile yapılır genelde.
// POP : eleman çıkarma olayı için pop yapılır.
main(List<String> args) {
  MyStack myStack = MyStack();
  myStack.push(1907);
  myStack.push("Erdem");
  myStack.push(true);

  print(myStack.pop());
  print(myStack.pop());
  print(myStack.pop());

  IntMyStack intmystack = IntMyStack();
  intmystack.push(98);

  StringMyStack stringMyStack = StringMyStack();
  stringMyStack.push("Angara");

  GenericStack genericStack = GenericStack();
  genericStack.push("TTT");
}

class MyStack {
  List _list = [];

  push(yeniEleman) {
    _list.add(yeniEleman);
  }

  pop() {
    return _list.removeLast();
  }
}

class IntMyStack {
  List<int> _list = <int>[];

  void push(int yeniEleman) {
    _list.add(yeniEleman);
  }

  int pop() {
    return _list.removeLast();
  }
}

class StringMyStack {
  List<String> _list = [];
  void push(String yeniEleman) {
    _list.add(yeniEleman);
  }

  String pop() {
    return _list.removeLast();
  }
}

class GenericStack<T> {
  List<T> _list = [];
  void push(T yeniEleman) {
    _list.add(yeniEleman);
  }

  T pop() {
    return _list.removeLast();
  }
}
