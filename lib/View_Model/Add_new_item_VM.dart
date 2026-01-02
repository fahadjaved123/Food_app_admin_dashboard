import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_app_adminpanel/Repository/Add_item_Repo.dart';
import 'package:get/get.dart';

class AddItemViewModel extends GetxController {
  final storage = FlutterSecureStorage();
  final AddItemRepo _repo = AddItemRepo();

  /// Loading state
  RxBool isLoading = false.obs;
  RxInt currentindex = 0.obs;
 

  /// API response message
  RxString message = ''.obs;

  /// Add item API call
  Future<bool> addItem({
    required String name,
    required String category,
    required String price,
    Uint8List? imageBytes,
    String? imageName,
  }) async {
    isLoading.value = true;
    message.value = '';
    final token = await storage.read(key: "token");
    print(token);
    try {
      final response = await _repo.addItem(
        name: name,
        category: category,
        price: price,
        imageBytes: imageBytes,
        imageName: imageName,
      );

      isLoading.value = false;
      print(response);
      if (response['success'] == true) {
        message.value = 'Item added successfully';
        return true;
      } else {
        message.value = response['message'] ?? 'Failed to add item';
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      message.value = 'Unexpected error: $e';
      return false;
    }
  }
}
