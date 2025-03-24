import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_base_structure/core/error/exceptions.dart';
import 'package:flutter_base_structure/core/error/failures.dart';
import 'package:flutter_base_structure/data/net/api_endpoint_input.dart';
import 'package:flutter_base_structure/data/remote/base/index.dart';
import 'package:flutter_base_structure/domain/model/index.dart';
import 'package:flutter_base_structure/presentation/base/base_page.dart';
import 'package:flutter_base_structure/presentation/base/base_page_mixin.dart';

class UserApiImpl extends BaseApi implements UserApi {
  @override
  Future<BaseResponse<LoginResponse>> login(
      {required ParamsLogin params}) async {
    var body = params.toJson();
    Logger().d("Model login API$body");
    final connection = await initConnection();
    final json = await connection.execute(ApiInput(
      endPointProvider!.endpoints['sign_in']!,
      body: body,
    ));
    BaseResponse<LoginResponse> response = BaseResponse<LoginResponse>.fromJson(
        json: json, fromJsonModel: LoginResponse.fromJsonModel);
    Logger().d("Model login response: ${response.toJson()}");
    if (!response.success) {
      throw RemoteException(
          errorMessage: response.msg ?? UNKNOWN_ERROR_MESSAGE);
    }
    return response;
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<SettingModel> updateSetting({required UpdateSettingParam param}) {
    // TODO: implement updateSetting
    throw UnimplementedError();
  }
}
