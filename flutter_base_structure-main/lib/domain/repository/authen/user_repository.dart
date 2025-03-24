import 'package:flutter_base_structure/domain/model/index.dart';

abstract class UserRepository {

  Future<BaseResponse<LoginResponse>> login({required ParamsLogin params});

  Future<bool> isLogged();

  Future<bool> logout({bool remoteLogout = false});

  Future<SettingModel> updateSetting(
      {required UpdateSettingParam param});
}
