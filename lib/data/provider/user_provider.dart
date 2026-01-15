import 'package:dio/dio.dart';

import '../model/user_model.dart';

class UserProvider {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://anapioficeandfire.com/api/"),
  );

  Future<UserModel> getUser() async {
    try {
      final response = await _dio.get("characters/583");
      return UserModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
