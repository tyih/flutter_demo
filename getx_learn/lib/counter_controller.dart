import 'package:get/get.dart';
import 'package:flutter/material.dart';

/// 状态管理
/// 状态管理器
///

// 1️⃣自定义 Controller 类继承自 GetxController ，Controller 中进行业务逻辑的处理，当需要改变状态数据时调用 update() 来通知数据改变
// 2️⃣在界面中使用时需要使用 GetBuilder 进行包裹，这样使用 Controller 中的数据变化时，调用 update() 后就会刷新界面控件。
// 3️⃣第一次使用某个 Controller 时需要进行初始化，后续再使用同一个 Controller 就不需要再进行初始化，即不需要配置 init
// 4️⃣初始化完成后，可以使用 Get.find() 找到对应的 Controller
// 5️⃣调用 update() 来通知数据改变

// 1.自定义 Controller 类继承自 GetxController
class CounterController extends GetxController {
  int count = 0;

  void increment() {
    count ++;
    // 5.调用 update() 来通知数据改变
    update();
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 2.在界面中使用时需要使用 GetBuilder 进行包裹
            GetBuilder<CounterController>(
              // 3.第一次使用某个 Controller 时需要进行初始化
              init: CounterController(),
              builder: (controller) {
                return Text('${controller.count}', style: const TextStyle(fontSize: 50),);
              },
            ),
            GetBuilder<CounterController>(builder: (controller) { // 没有初始化
              return Text('${controller.count}', style: const TextStyle(fontSize: 25, color: Colors.blueAccent),);
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 4.可以使用 Get.find() 找到对应的 Controller
          CounterController controller = Get.find();
          // 调用 Controller 方法
          controller.increment();
        },
        child: const Icon(Icons.accessibility_sharp),
      ),
    );
  }
}
