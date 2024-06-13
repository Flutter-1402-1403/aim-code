import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/groups.dart';
import 'package:madarkharj/models/login_form_data.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginApiService {
  static const String apiUrl = 'http://10.0.2.2:8000/auth/jwt/create';
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
      
      if (response.statusCode == 401) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.flat,
          autoCloseDuration: const Duration(seconds: 5),
          title: const Text(
            ".اطلاعات وارد شده نادرست است",
            textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        );
      } else if (response.statusCode == 200) {
        FlutterSecureStorage secureStorage = const FlutterSecureStorage();
        await secureStorage.write(
            key: "refresh", value: response.data["refresh"]);
        await secureStorage.write(
            key: "access", value: response.data["access"]);
        Get.offAll(() => const GroupsPage());
        var accessToken = response.data["access"];
        final responses = await dio.get(
        'http://10.0.2.2:8000/user/me',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'JWT $accessToken',
          },
        ),
      );
        
      if (responses.statusCode == 200) {
        String userName = responses.data['username'];
       toastification.show(
          context: context,
          type: ToastificationType.success,
          style: ToastificationStyle.flat,
          autoCloseDuration: const Duration(seconds: 5),
          title: Text(
            "!عزیز خوش آمدی $userName",
            textAlign:TextAlign.right,
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        );
      }
      }
    } catch (error) {
      toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.flat,
          autoCloseDuration: const Duration(seconds: 5),
          title:const Text(
            ".اروری رخ داد لطفا دوباره امتحان کنید",
            textAlign:TextAlign.right,
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        );
    }
  }
}
