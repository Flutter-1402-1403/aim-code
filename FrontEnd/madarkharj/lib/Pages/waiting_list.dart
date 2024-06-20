import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:madarkharj/Pages/create_group.dart';
import 'package:madarkharj/widgets/dotted_divider.dart';

class WaitingListPage extends StatefulWidget {
  const WaitingListPage({super.key});

  @override
  State<WaitingListPage> createState() => _WaitingListPageState();
}

class _WaitingListPageState extends State<WaitingListPage>
    with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  var _bottomNavIndex = 0;
  // AnimationController _animationController;
  // Animation<double> animation;
  // CurvedAnimation curve;

  final iconList = <IconData>[Icons.home_rounded, Icons.person_rounded];
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    // GroupInfo.getGroupsInfo().then((groups) => {
    //       setState(() {
    //         _groups = groups;
    //         _isLoading = false;
    //       }),
    //     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 30,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "لیست انتظار",
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
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CustomListItem(
              amount: "50000", by: 'من', reason: 'شاممممممم');
        },
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final String amount;
  final String by;
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle rejection
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        minimumSize: Size(150, 35)),
                    child: const Text('رد کردن',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle approval
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        minimumSize: Size(150, 35)),
                    child: const Text('تایید',
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
