import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/welcome.dart';
import 'package:madarkharj/models/login_form_data.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginApiService {
  static const String apiUrl = 'http://193.151.150.132:8000/auth/jwt/create';

  static Future<void> signUp(LoginFormData formData, context) async {
    final Dio dio = Dio();
    try {
      final response = await dio.post(
        apiUrl,
        data: formData.toJson(),
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      // Handle the response as needed
      if (response.statusCode == 401) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.flat,
          autoCloseDuration: const Duration(seconds: 5),
          title: const Text(
            ".اطلاعات وارد شده نادرست است",
            textAlign: TextAlign.end,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        );
      } else if (response.statusCode == 200) {
        FlutterSecureStorage secureStorage = const FlutterSecureStorage();
        await secureStorage.write(
            key: "refresh", value: response.data["refresh"]);
        await secureStorage.write(
            key: "access", value: response.data["access"]);
        Get.to(() => const WelcomePage());
      }
    } catch (error) {
      print(error);
    }
  }
}
