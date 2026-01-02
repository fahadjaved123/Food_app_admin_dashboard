import 'dart:convert';
import 'dart:io';
import 'package:food_app_adminpanel/Data/App_execpection.dart';
import 'package:food_app_adminpanel/Data/Network/Base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  dynamic Jsonreponse;
  @override
  Future GetAPi(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      Jsonreponse = ReturnResponse(response);
    } on SocketException {
      throw InternetException('internet error');
    } catch (e) {
      throw FetchdataException(e.toString());
    }
    return Jsonreponse;
  }

  @override
  Future PostAPi(String url, Map<String, dynamic> data) async {
    dynamic Jsonreponse;
    print(data);
    print(url);
    print('Rsponse$Jsonreponse');
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode(data),
          )
          .timeout(Duration(seconds: 20));

      Jsonreponse = ReturnResponse(response);
      print(response);
      print('Rsponse$Jsonreponse');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } on SocketException {
      throw InternetException('');
    } catch (e) {
      throw FetchdataException(e.toString());
    }
    return Jsonreponse;
  }
}

dynamic ReturnResponse(http.Response response) {
  final body = response.body.trim();
  switch (response.statusCode) {
    case 200:
      return {
        'success': true,
        'body': body,
        'headers': response.headers,
      };

    case 404:
      final errorMsg = jsonDecode(response.body)["Message"];
      throw FetchdataException(errorMsg);
    case 401:
      throw RequestTimeout();
    default:
      throw FetchdataException('Unexpected error: ${response.statusCode}');
  }
}
