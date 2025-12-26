abstract class BaseApiService {
  Future<dynamic> GetAPi(String url);
  Future<dynamic> PostAPi(String url,dynamic data);
}