import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Controllers/user_controller.dart';
import 'package:madarkharj/Pages/create_group.dart';
import 'package:madarkharj/Pages/waiting_list.dart';
import 'package:madarkharj/models/payment.dart';
import 'package:madarkharj/services/get_tokens.dart';
import 'package:madarkharj/services/payment.dart';
import 'package:madarkharj/widgets/dotted_divider.dart';
import 'package:toastification/toastification.dart';

class DebtPaymentPage extends StatefulWidget {
  const DebtPaymentPage({super.key});

  @override
  State<DebtPaymentPage> createState() => _DebtPaymentPageState();
}

class _DebtPaymentPageState extends State<DebtPaymentPage>
    with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  var _bottomNavIndex = 0;
  late List<Payment> pay;

final UserController userController = Get.find();

  final iconList = <IconData>[Icons.home_rounded, Icons.person_rounded];
  @override
  void initState() {
    super.initState();
    PeymentService.getPayment(context).then((peyments) => {
          setState(() {
            pay = peyments;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 30,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "پرداخت بدهی",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 6, 157, 36),
        child: const Icon(Icons.add_rounded, size: 45, color: Colors.white),
        onPressed: () {
          Get.to(() => const CreateGroupPage());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: const Color.fromARGB(255, 6, 157, 36),
        height: Get.height / 13,
        backgroundColor: Colors.white,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.center,
        icons: iconList,
        activeIndex: 0,
        iconSize: 32,
        onTap: (int) {
          print(int);
        },
      ),
      body: ListView.builder(
        itemCount: pay.length,
        itemBuilder: (context, index) {
          return CustomListItem(
              amount: pay[index].price,
              by: pay[index].id,
              reason: pay[index].name);
        },
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final String amount;
  final int by;
  final String reason;

  const CustomListItem(
      {required this.amount,
      required this.by,
      required this.reason,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const Icon(Icons.attach_money, color: Colors.green),
                      const SizedBox(width: 8),
                      Text("مبلغ    $amount",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const Icon(Icons.person, color: Colors.green),
                      const SizedBox(width: 8),
                      Text("توسط     $by",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomPaint(
                    painter: DottedLinePainter(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      const Icon(Icons.chat, color: Colors.green),
                      const SizedBox(width: 8),
                      Text("بابت      $reason",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final Dio dio = Dio();
                      Map<String, String> tokens = await getTokens();
                      final access = tokens["access"];
                      final response = await dio.post(
                        'http://10.0.2.2:8000/waiting-list/',
                        data: {
                          "status": "Pending",
                          "user": null,
                          "transaction": null
                        },
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
                            "در لیست انطظار قرار گرفت",
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        );
                        Get.to(() => const WaitingListPage());
                      } else {
                        toastification.show(
                          context: context,
                          type: ToastificationType.error,
                          style: ToastificationStyle.flat,
                          autoCloseDuration: const Duration(seconds: 5),
                          title: const Text(
                            "مشکلی پیش آمد",
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        minimumSize: Size(150, 35)),
                    child: const Text('پرداخت',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
