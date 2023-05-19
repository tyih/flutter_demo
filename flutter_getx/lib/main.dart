import 'package:flutter/material.dart';
import 'package:flutter_getx/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: const Center(
              child: Text(
            'HELLO WORLD',
            style: TextStyle(fontSize: 12),
          )),
        ),
      ),
    );
  }
}
