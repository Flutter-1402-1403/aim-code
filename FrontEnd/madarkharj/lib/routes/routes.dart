import 'package:get/get.dart';
import 'package:madarkharj/Pages/login.dart';
import 'package:madarkharj/Pages/signup.dart';
import 'package:madarkharj/start_screen.dart';

appRoutes() => [
      GetPage(
        name: '/login',
        page: () => const LoginPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 100),
      ),
      GetPage(
        name: '/signup',
        page: () => const SignupPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 100),
      ),
      GetPage(
        name: '/startscreen',
        page: () => const StartScreen(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 100),
      ),
    ];
