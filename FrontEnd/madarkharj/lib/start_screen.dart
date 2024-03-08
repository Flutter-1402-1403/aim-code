import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/login.dart';
import 'package:madarkharj/Pages/signup.dart';

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
    return SizedBox(
      width: double.infinity,
      child:
          // Container(
          // margin: const EdgeInsets.all(40),
          // child:
          Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/wave.png",
            width: double.maxFinite,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  ";خرجاتو بگو ، قرضاتو بگیر",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Peyda",
                    color: Color.fromARGB(255, 39, 134, 100),
                  ),
                  textAlign: TextAlign.right,
                ),
                const Text(
                  "!مدیریتش با ما",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Peyda",
                    color: Color.fromARGB(255, 39, 134, 100),
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to( SignupPage());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 39, 134, 100),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 25,
                        )),
                    child: const Text(
                      "ثبت نام",
                      style: TextStyle(
                        fontFamily: "Peyda",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(LoginPage());
                    },
                    style: OutlinedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 39, 134, 100),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 39, 134, 100),
                          width: 3,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 25,
                        )),
                    child: const Text(
                      "ورود",
                      style: TextStyle(
                        fontFamily: "Peyda",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
