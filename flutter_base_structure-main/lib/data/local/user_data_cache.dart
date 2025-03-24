import 'dart:convert';

import '../../domain/model/index.dart';
import 'index.dart';

abstract class UserDataCache {
  Future<bool> saveUserData({required UserModel user});

  Future<bool> saveContrastData({required ContrastModel walletModel});

  Future<bool> saveFirstTimeLogin({required bool isFirstTimeLogin});

  Future<UserModel?> getCacheUser();

  Future<ContrastModel?> getCacheContrast();

  Future<bool> getIsFirstTimeLogin();

  UserModel? getSyncCacheUser();

  ContrastModel? getSyncCacheContrast();

  bool getSyncIsFirstTimeLogin();

  Future<void> loadCacheData();

  Future<bool> removeCache();

}

class UserDataCacheImpl extends UserDataCache {
  final LocalDataStorage _storage;

  UserDataCacheImpl(this._storage);

  UserModel? _cachedUser;
  ContrastModel? _cachedWallet;
  bool? _isFirstTimeLogin;

  static const String userKey = "CONTRAST_USER_KEY";
  static const String contrastKey = "CONTRAST_WALLET_KEY";
  static const String isFirstLoginKey = "CONTRAST_FIRST_LOGIN_KEY";

  @override
  Future<void> loadCacheData() async {
    _cachedUser = await getCacheUser();
    _cachedWallet = await getCacheContrast();
    _isFirstTimeLogin = await getIsFirstTimeLogin();
  }

  @override
  Future<bool> removeCache() async {
    await Future.wait([
      _storage.remove(userKey),
      _storage.remove(contrastKey),
      _storage.remove(isFirstLoginKey),
    ]);
    _cachedUser = null;
    _cachedWallet = null;
    _isFirstTimeLogin = null;
    return true;
  }

  @override
  Future<UserModel?> getCacheUser() async {
    var userString = await _storage.getString(userKey);
    if (userString != null && userString.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(userString);
      return UserModel.fromJson(json);
    }
    return null;
  }

  @override
  Future<bool> saveUserData({required UserModel user}) async {
    await _storage.saveString(userKey, jsonEncode(user.toJson()));
    _cachedUser = user;
    return true;
  }

  @override
  UserModel? getSyncCacheUser() {
    return _cachedUser;
  }

  @override
  Future<ContrastModel?> getCacheContrast() async {
    var walletString = await _storage.getString(contrastKey);
    if (walletString != null && walletString.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(walletString);
      return ContrastModel.fromJson(json);
    }
    return null;
  }

  @override
  Future<bool> saveContrastData({required ContrastModel walletModel}) async {
    await _storage.saveString(contrastKey, jsonEncode(walletModel.toJson()));
    _cachedWallet = walletModel;
    return true;
  }

  @override
  ContrastModel? getSyncCacheContrast() {
    return _cachedWallet;
  }

  @override
  Future<bool> getIsFirstTimeLogin() async {
    var isFirstTimeLogin = await _storage.getBool(isFirstLoginKey);
    _isFirstTimeLogin = isFirstTimeLogin;
    return isFirstTimeLogin ?? false;
  }

  @override
  Future<bool> saveFirstTimeLogin({required bool isFirstTimeLogin}) async {
    await _storage.saveBool(isFirstLoginKey, isFirstTimeLogin);
    return true;
  }

  @override
  bool getSyncIsFirstTimeLogin() {
    return _isFirstTimeLogin ?? false;
  }
}
