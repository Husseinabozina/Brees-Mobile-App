typedef JsonMap = Map<String, dynamic>;

abstract interface class ApiClient {
  Future<JsonMap> get(String path);

  Future<JsonMap> post(
    String path, {
    JsonMap body = const <String, dynamic>{},
  });
}
