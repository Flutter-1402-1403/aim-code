import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/second_start_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StartScreen();
  }
}

class _StartScreen extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40 , vertical: 100),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/wallet.png'),
                    ),
                    const Text(
                      "ما در تلاشیم که مدیریت حساب ها رو متحول کنیم",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(83, 83, 83, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      style:ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 39, 134, 100),
                          textStyle: const TextStyle(
                            fontSize: 25,
                          )),
                      onPressed: () {
                          Get.to(() => const SecondStartSCreen());
                        },
                      child: const Text(
                        'بعدی',
                        style: TextStyle(fontFamily: 'Peyda'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
