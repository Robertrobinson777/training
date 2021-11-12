import 'package:get/get.dart';

import '../users_model.dart';

class UsersProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Users.fromJson(map);
      if (map is List) return map.map((item) => Users.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Users?> getUsers(int id) async {
    final response = await get('users/$id');
    return response.body;
  }

  Future<Response<Users>> postUsers(Users users) async =>
      await post('users', users);
  Future<Response> deleteUsers(int id) async => await delete('users/$id');
}
