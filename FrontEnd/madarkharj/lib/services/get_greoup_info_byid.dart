import 'package:dio/dio.dart';
import 'package:madarkharj/models/groups_data.dart';
import 'package:madarkharj/services/get_tokens.dart';
class GetGroupInfoById {
  static Future<Group> getGroupsInfo(int groupId) async {
    final url = 'http://10.0.2.2:8000/groups/$groupId';
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
        final  groups =  Group.fromJson(response.data);
        return groups;
      } else {
        throw Exception('Failed to load groups: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
