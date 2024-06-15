import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/login.dart';
import 'package:madarkharj/models/signup_form_data.dart';
import 'package:toastification/toastification.dart';
import 'package:madarkharj/services/get_tokens.dart';


class SignupApiService {
  static const String apiUrl = 'http://10.0.2.2:8000/user/';

  static Future<void> signUp(SignUpFormData formData, context) async {
    Map<String, String> tokens = await getTokens();
    final accessToken = tokens["access"];
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
            'Accept': 'application/json',
            'Authorization': 'JWT $accessToken',
          },
        ),
      );
      print(response.statusCode);
      // Handle the response as needed
      if (response.statusCode == 400) {
        String field = response.data.keys.first;
        String errorMessage = response.data[field][0];
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.flat,
          autoCloseDuration: const Duration(seconds: 5),
          title: Text(
            errorMessage,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
        );
      } else if (response.statusCode == 201) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          style: ToastificationStyle.flat,
          autoCloseDuration: const Duration(seconds: 5),
          title: const Text(
            ".ثبت نام شما با موفقیت انجام شد",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
        );
        Get.to(() => const LoginPage());
      }
    } catch (error) {
      print(error);
    }
  }
}
