class UpdateSettingParam {
  bool pushNotificationOn;

  UpdateSettingParam({required this.pushNotificationOn});

  Map<String, dynamic> toJson() {
    return {'enable': pushNotificationOn};
  }
}
