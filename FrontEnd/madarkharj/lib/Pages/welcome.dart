import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:madarkharj/services/get_tokens.dart';
import 'package:madarkharj/Pages/start_screen.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:madarkharj/widgets/group_info.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  String _usersName = '';
  bool _isLoading = true;
  var _bottomNavIndex = 0;
  // AnimationController _animationController;
  // Animation<double> animation;
  // CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home_rounded,
    Icons.home_rounded,
    Icons.person_outline_outlined,
  ];
  @override
  void initState() {
    super.initState();
    fetchData();
    // _animationController = AnimationController(
    //   duration: const Duration(seconds: 1),
    //   vsync: this,
    // );
    // curve = CurvedAnimation(
    //   parent: _animationController,
    //   curve: const Interval(
    //     0.5,
    //     1.0,
    //     curve: Curves.fastOutSlowIn,
    //   ),
    // );
    // animation = Tween<double>(
    //   begin: 0,
    //   end: 1,
    // ).animate(curve);

    // Future.delayed(
    //   const Duration(seconds: 1),
    //   () => _animationController.forward(),
    // );
  }

  static const String apiUrl = 'http://193.151.150.132:8000/user/me';

  Future<void> fetchData() async {
    final Dio dio = Dio();
    Map<String, String> tokens = await getTokens();
    final access = tokens["access"];
    try {
      final response = await dio.get(
        apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'JWT $access',
          },
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          _usersName = response.data["username"];
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GroupInfoCard(),
              GroupInfoCard(),
              GroupInfoCard(),
              GroupInfoCard(),
              Text(
                '!شما فعلا گروهی ندارید',
                style: TextStyle(
                    fontSize: 23, color: Color.fromARGB(255, 6, 157, 36)),
              )
              // const Text(
              //   "خوش آمدید",
              //   textAlign: TextAlign.right,
              //   style: TextStyle(
              //     decoration: TextDecoration.none,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 39, 134, 100),
              //   ),
              // ),
              // const SizedBox(
              //   height: 50,
              // ),
              // _isLoading
              //     ? const CircularProgressIndicator()
              //     : _usersName.isNotEmpty
              //         ? Text(
              //             _usersName,
              //             style: const TextStyle(
              //               decoration: TextDecoration.none,
              //               fontWeight: FontWeight.bold,
              //               color: Color.fromARGB(255, 39, 134, 100),
              //             ),
              //           )
              //         : const Text(
              //             'Initial State',
              //             style: TextStyle(
              //               decoration: TextDecoration.none,
              //               fontWeight: FontWeight.bold,
              //               color: Color.fromARGB(255, 39, 134, 100),
              //             ),
              //           ),
            ],
          ),
        ),
      ),
    );
  }
}
