import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Route Managment',
      initialRoute: '/welcome',
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
          )
          // textButtonTheme: TextButtonThemeData(
          //   style: TextButton.styleFrom(
          //     textStyle: const TextStyle(fontFamily: 'Peyda'),
          //   ),
          // ),
          // elevatedButtonTheme: ElevatedButtonThemeData(
          //   style: ElevatedButton.styleFrom(
          //     textStyle: const TextStyle(
          //       fontFamily: 'Peyda',
          //     ),
          //   ),
          // ),
          // outlinedButtonTheme: OutlinedButtonThemeData(
          //   style: OutlinedButton.styleFrom(
          //     textStyle: const TextStyle(fontFamily: 'Peyda'),
          //   ),
          // ),
          ),
    );
  }
}
