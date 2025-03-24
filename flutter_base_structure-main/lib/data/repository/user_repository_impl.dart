import 'dart:convert';

import 'package:flutter_base_structure/data/local/index.dart';
import 'package:flutter_base_structure/data/remote/base/interface_api.dart';
import 'package:flutter_base_structure/domain/model/index.dart';
import 'package:flutter_base_structure/domain/repository/index.dart';
import 'package:flutter_base_structure/presentation/utils/index.dart';

class AuthenticationRepositoryImpl implements UserRepository {
  final UserApi _authenApi;
  final AuthenCache _authenCacheImpl;
  final PushNotificationHandler _pushNotificationHandler;
  final UserDataCache _userCache;
  final SettingCache _settingCache;

  AuthenticationRepositoryImpl(
    this._authenApi,
    this._authenCacheImpl,
    this._pushNotificationHandler,
    this._userCache,
    this._settingCache,
  );

  @override
  Future<BaseResponse<LoginResponse>> login(
      {required ParamsLogin params}) async {
    final response = await _authenApi.login(params: params);
    // _authenCacheImpl.putToken(TokenModel(token: response.data?.token ?? ''));
    // if (response.data?.user != null) {
    //   _authenCacheImpl.putPassword(password: params.password!);
    //   await _userCache.saveUserData(user: response.data!.user!);
    //   await _userCache.saveFirstTimeLogin(
    //       isFirstTimeLogin: response.data!.user?.loginInFirstTime ?? false);
    // }
    // if (response.data?.wallet != null) {
    //   await _userCache.saveWalletData(walletModel: response.data!.wallet!);
    // }
    // if (response.data?.user?.setting != null) {
    //   _settingCache.saveSetting(setting: response.data!.user!.setting!);
    // }
    return response;
  }

  @override
  Future<bool> isLogged() async {
    var tokenCached = await _authenCacheImpl.getCachedToken();
    return (tokenCached?.token.isNotEmpty ?? false);
  }

  @override
  Future<bool> logout({bool remoteLogout = false}) async {
    if (remoteLogout) {
      bool result = false;
      try {
        result = await _authenApi.logout();
      } finally {
        clearCached();
      }
      return result;
    }
    await clearCached();
    return true;
  }

  @override
  Future<SettingModel> updateSetting(
      {required UpdateSettingParam param}) async {
    final response = (await _authenApi.updateSetting(param: param));
    await _settingCache.saveSetting(setting: response);
    return response;
  }

  Future clearCached() async {
    await Future.wait([
      _authenCacheImpl.removeCache(),
      _pushNotificationHandler.clear(),
      _userCache.removeCache(),
      _settingCache.removeCache()
    ]);
  }
}
