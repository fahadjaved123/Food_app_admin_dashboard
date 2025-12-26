
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
  Future PostAPi(String url, data) async {
    dynamic jsonreponse;
    print(data);
    print(url);
    print('Rsponse$jsonreponse');
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));

      jsonreponse = ReturnResponse(response);
      print('Rsponse$Jsonreponse');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } on SocketException {
      throw InternetException('');
    } catch (e) {
      return FetchdataException(e.toString());
    }
    return jsonreponse;
  }
}

dynamic ReturnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return {
        'success': true,
        'body': response.body,
        'headers': response.headers
      };
    case 400:
      throw InvalidaUrl();
    case 401:
      throw RequestTimeout();
    default:
      throw FetchdataException('internet error');
  }
}
