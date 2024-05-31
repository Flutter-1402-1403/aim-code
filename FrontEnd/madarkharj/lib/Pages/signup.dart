import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/login.dart';
import 'package:madarkharj/widgets/appbar_widget.dart';
import 'package:madarkharj/models/signup_form_data.dart';
import 'package:madarkharj/services/signup_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _signupkey = GlobalKey<FormState>();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstName.dispose();
    lastName.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          title: "ثبت نام",
        ),
        body:SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.topRight,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Form(
                          key: _signupkey,
                          child: Column(
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  controller: firstName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'لطفا این فیلد را خالی نگذارید.';
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(fontSize: 19),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person_sharp),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 18),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFFFF5151),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFFFF3B3B),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    errorStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFFF3B3B),
                                      fontSize: 14,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 209, 209, 209),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromARGB(255, 209, 209, 209),
                                      ),
                                    ), //<-- SEE HERE),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'نام',
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  controller: lastName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'لطفا این فیلد را خالی نگذارید.';
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(fontSize: 19),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person_sharp),
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
                                        color:
                                            Color.fromARGB(255, 209, 209, 209),
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
                                        color:
                                            Color.fromARGB(255, 209, 209, 209),
                                      ),
                                    ), //<-- SEE HERE),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "نام خانوادگی",
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
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
                                  style: const TextStyle(fontSize: 19),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                        Icons.alternate_email_rounded),
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
                                        color:
                                            Color.fromARGB(255, 209, 209, 209),
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
                                        color:
                                            Color.fromARGB(255, 209, 209, 209),
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
                                height: 20,
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  controller: password,
                                  validator: (value) {
                                    RegExp passwordValidation = RegExp(
                                        r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).*$');
                                    RegExp passwordCharacterCount =
                                        RegExp(r"^.{8,}$");
                                    if (value == null || value.isEmpty) {
                                      return 'لطفا این فیلد را خالی نگذارید.';
                                    } else if (!passwordCharacterCount
                                        .hasMatch(value)) {
                                      return 'رمز عبور باید حد اقل 8 نویسه باشد.';
                                    } else if (!passwordValidation
                                        .hasMatch(value)) {
                                      return 'باید ترکیبی از عدد ، حروف بزرگ و کوچک باشد.';
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
                                        color:
                                            Color.fromARGB(255, 209, 209, 209),
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
                              const SizedBox(
                                height: 20,
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'لطفا این فیلد را خالی نگذارید.';
                                    } else if (value != password.text) {
                                      return 'پسورد ها یکی نیستند.';
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
                                        color:
                                            Color.fromARGB(255, 209, 209, 209),
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
                                        color:
                                            Color.fromARGB(255, 209, 209, 209),
                                      ),
                                    ), //<-- SEE HERE),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'تکرار رمز عبور',
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // checking if the form has any errors in validation

                                    if (!_signupkey.currentState!.validate())
                                      return;

                                    SignUpFormData formData = SignUpFormData(
                                      firstName: firstName.text,
                                      lastName: lastName.text,
                                      username: userName.text,
                                      password: password.text,
                                    );
                                    SignupApiService.signUp(formData, context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 6, 157, 36),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    textStyle: const TextStyle(fontSize: 25),
                                  ),
                                  child: const Text(
                                    "ثبت نام",
                                    style: TextStyle(fontFamily: 'Peyda'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () =>
                                        {Get.to(() => const LoginPage())},
                                    child: const Text(
                                      'ورود',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 6, 157, 36),
                                      ),
                                    ),
                                  ),
                                  const Text('حساب کاربری دارید؟',
                                      style: TextStyle(fontSize: 20)),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
