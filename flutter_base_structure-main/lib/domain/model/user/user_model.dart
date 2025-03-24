class UserModel {

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }

  static UserModel fromJsonModel(Map<String, dynamic> json) =>
      UserModel.fromJson(json);
}
