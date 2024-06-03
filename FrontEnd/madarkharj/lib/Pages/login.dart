import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/signup.dart';
import 'package:madarkharj/models/login_form_data.dart';
import 'package:madarkharj/services/login_service.dart';
import 'package:madarkharj/widgets/appbar_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  final _loginkey = GlobalKey<FormState>();

  final userName = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: "خوش آمدید",
      ),
      body: SafeArea(
        child: SizedBox(
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
                    const SizedBox(
                      height: 150,
                    ),
                    Form(
                      key: _loginkey,
                      child: Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              controller: userName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'لطفا این فیلد را خالی نگذارید.';
                                }
                                return null;
                              },
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 19,
                              ),
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.alternate_email_rounded),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 18),

                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFF5151),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFF3B3B),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFF3B3B),
                                  fontSize: 14,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 209, 209, 209),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 209, 209, 209),
                                  ),
                                ), //<-- SEE HERE),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'نام کاربری',
                                labelStyle: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
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
                              controller: password,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'لطفا این فیلد را خالی نگذارید.';
                                }
                                return null;
                              },
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontSize: 19),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 18),

                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFF5151),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFF3B3B),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFF3B3B),
                                  fontSize: 14,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFDFDFDF),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 209, 209, 209),
                                  ),
                                ), //<-- SEE HERE),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'رمز عبور',
                                labelStyle: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!_loginkey.currentState!.validate()) return;

                          LoginFormData formData = LoginFormData(
                            username: userName.text,
                            password: password.text,
                          );
                          LoginApiService.signUp(formData, context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 6, 157, 36),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            textStyle: const TextStyle(
                              fontSize: 25,
                            )),
                        child: const Text(
                          "ورود",
                          style: TextStyle(fontSize: 25, fontFamily: 'Peyda'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () { Get.toNamed('signup'); },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 2.0,
                              color: Color.fromARGB(255, 6, 157, 36),
                            ),
                            foregroundColor: const Color.fromARGB(255, 6, 157, 36),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            textStyle: const TextStyle(
                              fontSize: 25,
                            )),
                        child: const Text(
                          "ثبت نام",
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'Peyda',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
