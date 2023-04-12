abstract class IRepository {
  Future<String?> login(String username, String password);
  Future<String?> persistToken(String token);
  Future<String?> hasToken();
  Future<bool> deleteToken();
}
