import 'package:get_storage/get_storage.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';
import '../helpers/enum/app_mode.dart';
import 'secure_shared_prefs.dart';
import 'secured_string_value.dart';

class AppSharedPrefs {
  SecureStringValue token = SecureStringValue(_SPKeys.tokenKey);
  SecureStringValue refreshToken = SecureStringValue(_SPKeys.refreshTokenKey);
  SecureStringValue userModel = SecureStringValue(_SPKeys.userModel);

  final ReadWriteValue<String> _appMode =
      ReadWriteValue(_SPKeys.appMode, AppMode.Light.name);
  final ReadWriteValue<bool> _rememberMe =
      ReadWriteValue(_SPKeys.rememberMe, false);
  final ReadWriteValue<String?> _appLanguage =
      ReadWriteValue(_SPKeys.appLanguage, null);

  Future<void> init() async {
    await GetStorage.init();
    await _initAllSecure();
  }

  Future<void> _initAllSecure() async {
    await token.fetch();
    await userModel.fetch();
    await refreshToken.fetch();
  }

  void setUserModel(UserModel user) {
    userModel.setValue(user.toJson());
  }

  UserModel getUser(){
    return UserModel.fromJson(userModel.val!);
  }

  Future<void> clearSecureSP() async {
    return SecureSharedPrefs.clear();
  }

  bool get isRememberMe => _rememberMe.val;

  Future<void> setRememberMe(bool rememberMe) async {
    _rememberMe.val = rememberMe;
  }
}

extension FirstRunSPValue on AppSharedPrefs {
  String get appMode => _appMode.val;

  String? get appLanguage => _appLanguage.val;

  void setAppMode(String appMode) {
    _appMode.val = appMode;
  }

  void selectLang(String locale) {
    _appLanguage.val = locale;
  }
}

abstract class _SPKeys {
  static const tokenKey = 'tokenKey';
  static const rememberMe = 'rememberMe';
  static const refreshTokenKey = 'refreshTokenKey';
  static const userModel = 'userModel';
  static const appMode = 'appMode';
  static const appLanguage = 'appLanguage';
}
