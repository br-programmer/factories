abstract class PersistentStorageRepository {
  Future<bool> get isLogin;
  Future<void> savedSesion();
  Future<void> logout();
}
