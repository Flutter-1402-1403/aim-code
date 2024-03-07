import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/start_screen.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Get.to(const StartScreen());
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 39, 134, 100),
                        size: 60,
                      ),
                    ),
                    const Text(
                      "ثبت نام",
                      style: TextStyle(
                        color: Color.fromARGB(255, 39, 134, 100),
                        decoration: TextDecoration.none,
                        fontSize: 40,
                        fontFamily: "Peyda",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 19),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFDFDFDF),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        borderSide: const BorderSide(
                          width: 3,
                          color: Color(0xFFDFDFDF),
                        ),
                      ), //<-- SEE HERE),
                      filled: true,
                      fillColor: const Color(0xFFF3F3F3),
                      labelText: 'نام ',
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        fontFamily: "Peyda",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 19),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFDFDFDF),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        borderSide: const BorderSide(
                          width: 3,
                          color: Color(0xFFDFDFDF),
                        ),
                      ), //<-- SEE HERE),
                      filled: true,
                      fillColor: const Color(0xFFF3F3F3),
                      labelText: "نام خانوادگی",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        fontFamily: "Peyda",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 19),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFDFDFDF),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        borderSide: const BorderSide(
                          width: 3,
                          color: Color(0xFFDFDFDF),
                        ),
                      ), //<-- SEE HERE),
                      filled: true,
                      fillColor: const Color(0xFFF3F3F3),
                      labelText: 'نام کاربری',
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        fontFamily: "Peyda",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 19),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFDFDFDF),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        borderSide: const BorderSide(
                          width: 3,
                          color: Color(0xFFDFDFDF),
                        ),
                      ), //<-- SEE HERE),
                      filled: true,
                      fillColor: const Color(0xFFF3F3F3),
                      labelText: 'رمز عبور',
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        fontFamily: "Peyda",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 19),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFDFDFDF),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        borderSide: const BorderSide(
                          width: 3,
                          color: Color(0xFFDFDFDF),
                        ),
                      ), //<-- SEE HERE),
                      filled: true,
                      fillColor: const Color(0xFFF3F3F3),
                      labelText: 'تکرار رمز عبور',
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        fontFamily: "Peyda",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Get.to(const LoginPage());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 39, 134, 100),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontFamily: "Peyda"
                        )),
                    child: const Text("ثبت نام"),
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
