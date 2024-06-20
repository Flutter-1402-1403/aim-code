import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Controllers/user_controller.dart';
import 'package:madarkharj/routes/routes.dart';

void main() {
  Get.put(UserController()); // Initialize the UserController
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Route Managment',
      initialRoute: '/startscreen',
      defaultTransition: Transition.rightToLeftWithFade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      getPages: appRoutes(),
      theme: ThemeData(
        fontFamily: 'Peyda',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontFamily: 'Peyda'),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontFamily: 'Peyda',
              ),
            ),
          ),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255,237, 247, 238),
        appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255,237, 247, 238), )
      ),
    );
  }
}
