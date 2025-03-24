class TokenModel {
  String token;

  TokenModel({required this.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(token: json['token'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
