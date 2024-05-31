import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/login.dart';
import 'package:madarkharj/Pages/signup.dart';

class SecondStartSCreen extends StatefulWidget {
  const SecondStartSCreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SecondStartSCreen();
  }
}

class _SecondStartSCreen extends State<SecondStartSCreen> {
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
                      image: AssetImage('assets/images/group.png'),
                    ),
                    const Text(
                      'مادرخرج یک برنامه برای مدیریت حساب های دسته جمعیه',
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
                          Get.to(() => const SignupPage());
                        },
                      child: const Text(
                        'ثبت نام',
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
