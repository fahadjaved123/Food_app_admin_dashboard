import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_app_adminpanel/res/App_urls/App_Urls.dart';
import 'package:http/http.dart' as http;

class AddItemRepo {
  final storage = FlutterSecureStorage();

  /// Add item to server with optional image
  Future<Map<String, dynamic>> addItem({
    required String name,
    required String category,
    required String price,
    Uint8List? imageBytes,
    String? imageName,
  }) async {
    print(imageBytes);
    print(imageName);
    final url = Uri.parse(AppUrl.additem);
    final token = await storage.read(key: "token");

    if (token == null || token.isEmpty) {
      return {'success': false, 'message': 'Authorization token missing'};
    }

    try {
      // Create multipart request
      var request = http.MultipartRequest('POST', url);

      // Add text fields
      request.fields['Fname'] = name;
      request.fields['category'] = category;
      request.fields['Fprice'] = price;

      // Add image file if present
      if (imageBytes != null && imageName != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'Fimage', // must match multer field name
            imageBytes,
            filename: imageName,
          ),
        );
      }

      // Add headers
      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });

      // Send request
      final streamedResponse = await request.send().timeout(
            const Duration(seconds: 20),
          );
      final response = await http.Response.fromStream(streamedResponse);

      // Check status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return {'success': true, 'data': data};
      } else {
        return {
          'success': false,
          'message':
              'Failed to add item: ${response.statusCode} ${response.body}',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Error adding item: $e'};
    }
  }
}
