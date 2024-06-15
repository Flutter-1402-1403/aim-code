import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:madarkharj/widgets/appbar_widget.dart';
import 'package:madarkharj/widgets/dotted_divider.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.arguments.toString());
    final groupID = Get.arguments.toString();
    return Scaffold(
      appBar: CustomAppBar(
        title: ' id:$groupID   نام گروه',
        backButton: true,
      ),
      backgroundColor: const Color.fromRGBO(224, 224, 224, 1),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 6, 157, 36),
        child: const Icon(Icons.add_rounded, size: 45, color: Colors.white),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: const Color.fromARGB(255, 6, 157, 36),
        height: Get.height / 13,
        backgroundColor: Colors.white,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.center,
        icons: const [Icons.home, Icons.person_rounded],
        activeIndex: 0,
        iconSize: 32,
        onTap: (int) {
          print(int);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 44),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Center(
                      child: Column(
                        children: [
                          Text(
                            'مجموع طلب ها',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 44),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Center(
                      child: Column(
                        children: [
                          Text(
                            'مجموع بدهی ها',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            CustomPaint(
              painter: DottedLinePainter(),
              child: Container(
                height: 2,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildGridItem('assets/images/money-send.png', 'پرداخت بدهی' , 'debtpayment'),
                  _buildGridItem(
                      'assets/images/empty-wallet-add.png', 'افزودن خرج','addexpense'),
                  _buildGridItem(
                      'assets/images/empty-wallet-time.png', 'صف انتظار' ,'waitinglist'),
                  _buildGridItem('assets/images/groupusers.png', 'اعضا','groupmembers'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(String imagePath, String title ,String pagePath) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(pagePath);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: Gradient.lerp(null, null, 200),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 50,
                width: 50,
              ),
              const SizedBox(height: 10.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
