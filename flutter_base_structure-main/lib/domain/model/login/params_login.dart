class ParamsLogin {
  String? deviceId;
  String? deviceName;
  int? deviceType;
  String? fcmToken;
  String? phoneNumber;
  String? password;
  String? versionCode;

  ParamsLogin(
      {this.deviceId,
        this.deviceName,
        this.deviceType,
        this.fcmToken,
        this.phoneNumber,
        this.password,
        this.versionCode});

  ParamsLogin.fromJson(Map<String, dynamic> json) {
    deviceId = json['deviceId'];
    // deviceName = json['deviceName'];
    // deviceType = json['deviceType'];
    // fcmToken = json['fcmToken'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    // versionCode = json['versionCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deviceId'] = deviceId;
    // data['deviceName'] = deviceName;
    // data['deviceType'] = deviceType;
    // data['fcmToken'] = fcmToken;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    // data['versionCode'] = versionCode;
    return data;
  }
}