import 'package:dio/dio.dart';
import 'package:madarkharj/models/all_users.dart';
import 'package:madarkharj/models/user_data.dart';
import 'package:madarkharj/services/get_tokens.dart';

class GetAllUsers {
  static const String url = 'http://10.0.2.2:8000/user/';

  static Future<List<AllUser>> getAllUsers() async {
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
        print(response.data);
        final List<AllUser> users = AllUser.fromJsonList(response.data);
        return users;
      } else {
        throw Exception('Failed to load groups: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
