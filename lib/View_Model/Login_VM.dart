import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_app_adminpanel/Repository/Login_Repo.dart';
import 'package:food_app_adminpanel/Utils/Utils.dart';
import 'package:food_app_adminpanel/View/Main_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends GetxController {
  final storage = FlutterSecureStorage();
  final loginRepository = LoginRepository();

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final emailfocus = FocusNode().obs;
  final passwordfocus = FocusNode().obs;

  RxBool loading = false.obs;

  Future<void> loginApi(BuildContext context) async {
    loading.value = true;

    try {
      final response = await loginRepository.Loginapi(
        usernamecontroller.text.trim(),
        passwordcontroller.text.trim(),
      );

      loading.value = false;

      if (response["success"] == true) {
        // Save to SharedPrefs
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool("Login", true);

        // Save token in secure storage
        await storage.write(key: "token", value: response["token"]);

        Utils.FlashbarMessage("Successful Login", context);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MainPage()),
        );
      } else {
        Utils.FlashbarErrormessage(
            response["message"] ?? "Invalid credentials", context);
      }
    } catch (e) {
      loading.value = false;
      Utils.FlashbarErrormessage("Error: $e", context);
    }
  }
}
