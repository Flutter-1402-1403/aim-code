import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/start_screen.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                      "ورود",
                      style: TextStyle(
                          color: Color.fromARGB(255, 39, 134, 100),
                          decoration: TextDecoration.none,
                          fontSize: 40),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
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
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final dio = Dio();
                      final response = await dio.post(
                        'http://37.27.24.234:8000/auth/jwt/create',
                        data: {"username": "mahdi", "password": "mehdi@1383"},
                      );
                      print(response.data);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 39, 134, 100),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        textStyle: const TextStyle(
                          fontSize: 25,
                        )),
                    child: const Text("ورود"),
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
