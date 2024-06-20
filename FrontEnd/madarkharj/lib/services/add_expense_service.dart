import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/groups.dart';
import 'package:madarkharj/models/create_expense.dart';
import 'package:madarkharj/services/get_tokens.dart';
import 'package:toastification/toastification.dart';

class AddExpenseService {
  static const String url = 'http://10.0.2.2:8000/payments/';

  static Future<void> createGroup(AddExpenseModel data ,  context) async {
     final Dio dio = Dio();
    Map<String, String> tokens = await getTokens();
    final access = tokens["access"];
    print (data);
    try {
      final response = await dio.post(
        url,
        data:data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'JWT $access',
          },
        ),
      );
      if (response.statusCode == 201) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          style: ToastificationStyle.flat,
          autoCloseDuration: const Duration(seconds: 5),
          title: const Text(
            ".خرج با موفقیت ساخته شد",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        );
      Get.to(()=> const GroupsPage());
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
