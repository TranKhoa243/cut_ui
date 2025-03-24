import 'package:flutter_base_structure/domain/model/index.dart';



class LoginResponse {

  LoginResponse.fromJson(Map<String, dynamic> json) {

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }

  static LoginResponse fromJsonModel(Map<String, dynamic> json) =>
      LoginResponse.fromJson(json);
}
