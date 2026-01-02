import 'package:food_app_adminpanel/Data/Network/Network_api_service.dart';
import 'package:food_app_adminpanel/res/App_urls/App_Urls.dart';

class LoginRepository {
  final _apis = NetworkApiService();

  Future<Map<String, dynamic>> loginApi(String email, String password) async {
    try {
      final body = {"email": email, "password": password};

      final response = await _apis.PostAPi(AppUrl.login, body);

      if (response['success'] == true) {
        print("Responst ${response['body']}" );
        return {
          "success": true,
          "data": response['body'], // token / user data
        };
      } else {
        return {
          "success": false,
          "message": response['message'], // <-- FIX HERE
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": e.toString(),
      };
    }
  }
}
