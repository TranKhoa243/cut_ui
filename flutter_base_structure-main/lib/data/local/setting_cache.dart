import 'dart:convert';
import '../../domain/model/index.dart';
import 'index.dart';

abstract class SettingCache {
  Future<bool> saveSetting({required SettingModel setting});

  Future<SettingModel?> getCachedSetting();

  Future<bool> removeCache();

  Future<bool> didShowPolicyPage();
  Future<bool> saveDidShowPolicyPage();

}

class SettingCacheImpl extends SettingCache {
  final LocalDataStorage _storage;

  SettingCacheImpl(this._storage);

  static const String settingKey = "CONTRAST_SETTING_KEY";

  static const String showPolicyPageKey = "SHOW_POLICY_PAGE_KEY";

  @override
  Future<bool> removeCache() async {
    await _storage.remove(settingKey);
    return true;
  }

  @override
  Future<SettingModel?> getCachedSetting() async {
    var userString = await _storage.getString(settingKey);
    if (userString != null && userString.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(userString);
      return SettingModel.fromJson(json);
    }
    return null;
  }

  @override
  Future<bool> saveSetting({required SettingModel setting}) async {
    await _storage.saveString(settingKey, jsonEncode(setting.toJson()));
    return true;
  }

  @override
  Future<bool> didShowPolicyPage() async {
    return (await _storage.getBool(showPolicyPageKey) ?? false);

  }

  @override
  Future<bool> saveDidShowPolicyPage() async {
    return (await _storage.saveBool(showPolicyPageKey, true));

  }
}
