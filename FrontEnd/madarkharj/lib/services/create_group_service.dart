import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:madarkharj/services/get_tokens.dart';
import 'package:toastification/toastification.dart';

class CreateGroupService {
  static const String url = 'http://10.0.2.2:8000/groups';

  static Future<void> createGroup(context) async {
    Map<String, dynamic> mockData = {
    "name": "GAAAAAAAAAAA",
    "description": "ssssssssssssssssssssssss",
    "users": [1,2,3,4]
};
    final Dio dio = Dio();
    Map<String, String> tokens = await getTokens();
    final access = tokens["access"];
    try {
      final response = await dio.post(
        url,
        data:mockData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'JWT $access',
          },
        ),
      );
      print(response.statusCode);
      if (response.statusCode == 400) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          style: ToastificationStyle.flat,
          autoCloseDuration: const Duration(seconds: 5),
          title: const Text(
            ".گروه با موفقیت ساخته شد",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        );
      } else {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.flat,
          autoCloseDuration: const Duration(seconds: 5),
          title: const Text(
            ".در ساخت گروه مشگلی پیش آمد لطفا دوباره امتحان کنید",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        );
        throw Exception('Failed to load groups: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
