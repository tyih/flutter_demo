import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
            child: const Icon(Icons.email),
            onPressed: () async {
              count++;

              try {
                //
                throw Exception('一个dart异常同步');
              } catch (exception, stackTrace) {
                await Sentry.captureException(exception,
                    stackTrace: stackTrace);
              }
            }),
      );
}
