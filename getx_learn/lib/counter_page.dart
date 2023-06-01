import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 状态管理
/// 响应式变量
///
// 1️⃣定义响应式变量可以用在任何类型上
// final name = ''.obs;
// final isLogged = false.obs;
// final count = 0.obs;
// final balance = 0.0.obs;
// final number = 0.obs;
// final items = <String>[].obs;
// final myMap = <String, int>{}.obs;
//
// 自定义类 - 可以是任何类
// final user = User().obs;

// 2️⃣获取响应式变量的值
// String nameValue = name.value
// bool isLoggedValue = isLogged.value
// int countValue = count.value
// double numberValue = number.value
// String item = items[0] //不需要.value
// int value = myMap['key'] //不需要.value
// String name = user.value.name

// 3️⃣更新数据
// 对于基础数据类型，只需要对 value 重新赋值即可更新数据并通过 Obx 刷新界面
// name.value = "123"
// isLogged.value = true
// count.value = 1
// number.value = 12.0

// 对于其他数据类型需要调用 update 或者变量方法更新
// user.update((value) {
// value?.name = "123";
// });

// 4️⃣刷新界面
// 在界面上使用响应式变量只需在使用变量的控件上包裹 Obx 即可实现响应式更新，即变量的值发生变化时自动刷新界面
// Obx(() => Text("${count.value}"))

// 5️⃣数据变化监听
// 每次`count`变化时调用。
// ever(count, (newValue) => print("$newValue has been changed"));
//
// 只有在变量count在第一次被改变时才会被调用。
// once(count, (newValue) => print("$newValue was changed once"));
//
// 防DDos - 每当用户停止输入1秒时调用，例如。
// debounce(count, (newValue) => print("debouce$newValue"), time: Duration(seconds: 1));
//
// 忽略1秒内的所有变化，只有最后一次会触发回调。
// interval(count, (newValue) => print("interval $newValue"), time: Duration(seconds: 1));

class CounterPage extends StatelessWidget {
  CounterPage({Key? key}) : super(key: key);

  // 1)定义响应式变量
  var count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        // 2)获取响应式变量的值xxx.value，刷新界面Obx(...)
        child: Obx(() => Text("${count.value}")),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => count ++,
      ),
    );
  }
}
