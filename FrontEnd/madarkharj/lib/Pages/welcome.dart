import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madarkharj/services/get_tokens.dart';
import 'package:madarkharj/start_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String _usersName = '';
  bool _isLoading = true;

  static const String apiUrl = 'http://193.151.150.132:8000/user/me';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Get.to(const StartScreen());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 39, 134, 100),
            size: 60,
          ),
        ),
        const SizedBox(
          height: 350,
        ),
        Center(
          child: Column(
            children: [
              const Text(
                "خوش آمدید",
                textAlign: TextAlign.right,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: "Peyda",
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 39, 134, 100),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              _isLoading
                  ? const CircularProgressIndicator()
                  : _usersName.isNotEmpty
                      ? Text(
                          _usersName,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: "Peyda",
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 39, 134, 100),
                          ),
                        )
                      : const Text(
                          'Initial State',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: "Peyda",
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 39, 134, 100),
                          ),
                        ),
            ],
          ),
        )
      ],
    ));
  }
}
