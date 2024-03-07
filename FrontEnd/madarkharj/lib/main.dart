import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/routes/routes.dart';

void main() {
  runApp(
    const MaterialApp(
      locale: Locale("fa"),
      home: Scaffold(
          backgroundColor: Colors.white,
          body: DefaultTextStyle(
            style: TextStyle(
              backgroundColor: Colors.red,
            ),
            child: MyApp(),
          )),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Route Managment',
      initialRoute: '/startscreen',
      getPages: appRoutes(),
    );
  }
}
