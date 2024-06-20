import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/groups.dart';
import 'package:madarkharj/models/create_expense.dart';
import 'package:madarkharj/models/payment.dart';
import 'package:madarkharj/services/get_tokens.dart';
import 'package:toastification/toastification.dart';

class PeymentService {
  static const String url = 'http://10.0.2.2:8000/payments/';

  static Future<List<Payment>> getPayment( context) async {
     final Dio dio = Dio();
    Map<String, String> tokens = await getTokens();
    final access = tokens["access"];
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'JWT $access',
          },
        ),
      );
      if (response.statusCode == 200) {
        final  List<Payment> p =  Payment.fromJsonList(response.data);
        return p;
      } else {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          style: ToastificationStyle.flat,
          autoCloseDuration: const Duration(seconds: 5),
          title: const Text(
            ".مشکلی پیش آمد لطفا دوباره امتحان کنید",
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
