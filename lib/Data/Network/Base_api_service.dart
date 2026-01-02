abstract class BaseApiService {
  Future<dynamic> GetAPi(String url);
  Future<dynamic> PostAPi(String url, Map<String, String> data);
}
