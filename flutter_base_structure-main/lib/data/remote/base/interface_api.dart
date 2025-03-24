import 'package:flutter_base_structure/domain/model/index.dart';
// import 'package:flutter_base_structure/presentation/page/input_otp_code/index.dart';

abstract class UserApi {

  Future<BaseResponse<LoginResponse>> login({required ParamsLogin params});

  Future<SettingModel> updateSetting(
      {required UpdateSettingParam param});

  Future<bool> logout();
}

