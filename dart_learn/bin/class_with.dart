class Phone {
  void call() {
    print('Phone is calling...');
  }
}

mixin Android on Phone {
  void playStore() {
    print('Google play store');
  }

  @override
  void call() {
    super.call();
    print('Android call');
  }
}

class Ios {
  void appleStore() {
    print('Apple store');
  }

  void call() {
    print('IOS call');
  }
}

// 多继承，函数重名冲突（后面覆盖前面）
class Tom with Phone, Android, Ios {}

mixin AAAAA {
  // AAAAA();
}

class Xiao with Phone, Android {}

void main(List<String> args) {
  var t = Tom();
  t.call();
  t.playStore();
  t.appleStore();
}
