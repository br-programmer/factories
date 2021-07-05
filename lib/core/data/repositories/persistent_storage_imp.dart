import 'package:shared_preferences/shared_preferences.dart';
import 'package:factories/core/domain/repositories/persistent_storage_repository.dart';

const _pref_sesion = 'SESION';

class PersistentStorageImpl extends PersistentStorageRepository {
  Future<SharedPreferences> get _preff => SharedPreferences.getInstance();

  @override
  Future<bool> get isLogin async => await _isLogin();

  @override
  Future<void> savedSesion() async {
    final sharedPreferences = await _preff;
    await sharedPreferences.setBool(_pref_sesion, true);
  }

  @override
  Future<void> logout() async {
    final sharedPreferences = await _preff;
    await sharedPreferences.clear();
  }

  Future<bool> _isLogin() async {
    final sharedPreferences = await _preff;
    return sharedPreferences.getBool(_pref_sesion) ?? false;
  }
}
