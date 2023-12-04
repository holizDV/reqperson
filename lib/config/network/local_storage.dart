import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_string.dart';

@singleton
class LocalStorage {
  LocalStorage(this.pref);

  SharedPreferences pref;

  void setTokenUser(String token) {
    pref.setString(AppString.prefTokenUser, token);
  }

  String? getTokenUser() {
    return pref.getString(AppString.prefTokenUser);
  }

  void removeTokenUser() {
    pref.remove(AppString.prefTokenUser);
  }

  Future<void> clearAll() async {
    removeTokenUser();
  }

  void saveAllIdentity({
    required String userToken,
  }) {
    setTokenUser(userToken);
  }
}

@module
abstract class SharedPreferencesModul {
  @singleton
  Future<SharedPreferences> get instance async {
    final pref = await SharedPreferences.getInstance();
    return pref;
  }
}
