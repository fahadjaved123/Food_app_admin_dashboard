import 'dart:convert';

import 'package:food_app_adminpanel/Data/Network/Network_api_service.dart';
import 'package:food_app_adminpanel/res/App_urls/App_Urls.dart';

class LoginRepository {
  final _apis = NetworkApiService();
  Future<dynamic> Loginapi(String username, String password) async {
    final body = {"username": username, "password": password};
    final response = await _apis.PostAPi(AppUrl.login, body);

    if (response['success']) {
      final token = response["body"]['token'];

      return {"success": true, 'token': token}; // correct credentials
    } else {
      return {
        "success": false,
        "message": response["message"] ?? "Invalid credentials"
      }; // wrong credentials
    }
  }
}
