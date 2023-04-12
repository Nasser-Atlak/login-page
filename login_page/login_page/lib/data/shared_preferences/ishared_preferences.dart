abstract class ISharedPreferences {
  Future<String?> persistToken(String token);
  Future<String?> hasToken();
  Future<bool> deleteToken();
}
