import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future<Map<String, String>> getTokens() async {
  String? accessToken = await secureStorage.read(key: 'access');
  String? refreshToken = await secureStorage.read(key: 'refresh');

  return {'access': accessToken ?? '', 'refresh': refreshToken ?? ''};
}