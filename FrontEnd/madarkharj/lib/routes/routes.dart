import 'package:get/get.dart';
import 'package:madarkharj/Pages/add_expense.dart';
import 'package:madarkharj/Pages/create_group.dart';
import 'package:madarkharj/Pages/debt_ayment.dart';
import 'package:madarkharj/Pages/group_members.dart';
import 'package:madarkharj/Pages/groups.dart';
import 'package:madarkharj/Pages/login.dart';
import 'package:madarkharj/Pages/signup.dart';
import 'package:madarkharj/Pages/start_screen.dart';
import 'package:madarkharj/Pages/waiting_list.dart';
import 'package:madarkharj/models/groups_data.dart';

appRoutes() => [
      GetPage(
        name: '/login',
        page: () => const LoginPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/signup',
        page: () => const SignupPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/groups',
        page: () => const GroupsPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/group/:id',
        page: () => const GroupsPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/creategroup',
        page: () => const CreateGroupPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/addexpense',
        page: () => const AddExpense(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/groupmembers',
        page: () => const GroupMembersPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/waitinglist',
        page: () => const WaitingListPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/debtpayment',
        page: () => const DebtPaymentPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/startscreen',
        page: () => const StartScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/secondstartscreen',
        page: () => const StartScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ];