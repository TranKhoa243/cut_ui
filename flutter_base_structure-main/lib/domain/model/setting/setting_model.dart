class SettingModel {
  bool pushNotificationOn;

  SettingModel({required this.pushNotificationOn});

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    final pushNotificationOn =
        (json['SETTING_ALLOW_PUSH_NOTIFY']?.toString().toUpperCase() ?? '') ==
            'Y';
    return SettingModel(pushNotificationOn: pushNotificationOn);
  }

  Map<String, dynamic> toJson() {
    return {'SETTING_ALLOW_PUSH_NOTIFY': pushNotificationOn ? 'Y' : 'N'};
  }

  SettingModel copyWith({required bool pushNotificationOn}) {
    return SettingModel(pushNotificationOn: pushNotificationOn);
  }
}
