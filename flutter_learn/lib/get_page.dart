import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  var count = 0.obs;

  Home({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("GET")),
        body: Center(
          child: Obx(() => Text("count: $count")),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.email), onPressed: () => count++),
      );
}
