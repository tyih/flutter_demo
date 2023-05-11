abstract class Person {
  String name = 'tom';
  void printName() {
    print(name);
  }

  void absFunction();
}

class Teacher extends Person {
  int age = 26;
  printAge() {
    print('teacher age:$age');
  }

  @override
  void absFunction() {
    // TODO: implement absFunction
  }
}

extension Texten on Teacher {
  extensionFunction() {
    print('this is extension function');
  }
}

class Student implements Person {
  @override
  String name = 'ello';
  @override
  void printName() {
    print('student name: $name');
  }

  @override
  void absFunction() {
    // TODO: implement absFunction
  }
}

/// ------------------------------------------------
///

/// 工厂函数
abstract class Phone {
  void call();
  factory Phone(String type) {
    switch (type) {
      case 'android':
        return Android();
      case 'ios':
        return Ios();
      default:
        throw "The '$type' is error";
    }
  }
}

class Android implements Phone {
  @override
  void call() {
    print('Android calling');
  }
}

class Ios implements Phone {
  @override
  void call() {
    print('IOS calling');
  }
}

/// 单例模式
class Animal {
  static final Animal _signal = Animal._internal();
  Animal._internal();

  factory Animal() {
    return _signal;
  }

  void call() {
    print('Calling...');
  }
}

/// 减少重复实例对象
class AirPhone {
  int _number;
  AirPhone(this._number);

  factory AirPhone.fromJson(Map<String, dynamic> json) =>
      AirPhone(json['number']);

  call() {
    print('Calling $_number...');
  }
}

void main(List<String> args) {
  var p = Teacher();
  p.printName();
  p.printAge();
  p.extensionFunction();

  var s = Student();
  s.printName();

  var a1 = Animal();
  var a2 = Animal();
  print(identical(a1, a2));

  Animal().call();

  var ap = AirPhone.fromJson({'number': 999});
  ap.call();
}
