import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base_structure/domain/model/index.dart';
import 'package:flutter_base_structure/domain/model/login/token_model.dart';
import '../../core/utils/index.dart';
import 'storage/local_data_storage.dart';

abstract class AuthenCache {
  Future<TokenModel?> getCachedToken();

  Future<bool> putToken(TokenModel token);

  Future<bool> putUserData({required UserModel user});

  Future<UserModel?> getCacheUser();

  Future<bool> putPassword({required String password});

  Future<String> getCachePassword();

  Future<bool> removeCache();
}

class AuthenCacheImpl extends AuthenCache {
  LocalDataStorage _storage;

  AuthenCacheImpl(this._storage);

  static const String TOKEN_KEY = "CONTRAST_TOKEN_KEY";
  static const String USER_KEY = "CONTRAST_USER_KEY";
  static const String P_KEY = "PASSWORD_KEY";

  @override
  Future<TokenModel?> getCachedToken() async {
    var token = await _storage.getString(TOKEN_KEY) ?? '';
    return TokenModel(token: token);
  }

  @override
  Future<bool> putToken(TokenModel token) async {
    await _storage.saveString(TOKEN_KEY, token.token);
    return true;
  }

  @override
  Future<bool> removeCache() async {
    await _storage.remove(TOKEN_KEY);
    await _storage.remove(P_KEY);
    await _storage.remove(USER_KEY);
    return true;
  }

  @override
  Future<bool> putUserData({required UserModel user}) async {
    print('============== putUserData');
    await _storage.saveString(USER_KEY, jsonEncode(user));
    return true;
  }

  @override
  Future<UserModel?> getCacheUser() async {
    var user = await _storage.getString(USER_KEY);
    print('================ getCacheUser: $user}');
    if (user != null) {
      Map<String, dynamic> json = jsonDecode(user);
      return UserModel.fromJson(json);
    }else{
      return UserModel();
    }
  }

  @override
  Future<String> getCachePassword() async {
    final p = await _storage.getString(P_KEY);
    Encrypted encrypted = Encrypted.from64(p.toString());
    EncryptData.decryptAES(encrpt: encrypted);
    return EncryptData.decrypted??'';
  }

  @override
  Future<bool> putPassword({required String password}) async {
    if (kDebugMode) {
      print('============== putPassword');
    }
    EncryptData.encryptAES(password);
    final ePass = EncryptData.encrypted?.base64;
    await _storage.saveString(P_KEY, ePass??'');
    return true;
  }
}
