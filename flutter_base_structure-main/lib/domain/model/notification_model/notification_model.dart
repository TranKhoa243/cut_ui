import 'dart:convert';

import 'package:flutter_base_structure/core/utils/consts.dart';
import 'package:intl/intl.dart';

class NotificationModel {
  String? id;
  String? userId;
  int? type;
  String? title;
  String? shortContent;
  String? content;
  String? detailContent;
  String? readAt;
  String? createdAt;
  String? receiverId;

  NotificationModel(
      {this.id,
        this.userId,
        this.type,
        this.title,
        this.shortContent,
        this.content,
        this.detailContent,
        this.readAt,
        this.createdAt,
        this.receiverId});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    type = json['type'];
    title = json['title'];
    shortContent = json['shortContent'];
    content = json['content'];
    detailContent = json['detailContent'];
    readAt = json['readAt'];
    receiverId = json['receiverId'];
    createdAt = json['createdAt'] ?? DateFormat(DATE_TIME_FORMAT_FROM_SERVER).format(DateTime.now());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['type'] = type;
    data['title'] = title;
    data['shortContent'] = shortContent;
    data['content'] = content;
    data['detailContent'] = detailContent;
    data['readAt'] = readAt;
    data['receiverId'] = receiverId;
    data['createdAt'] = createdAt;
    return data;
  }

  String toJsonString() {
    final json = toJson();
    return jsonEncode(json);
  }

  static NotificationModel fromJsonModel(Map<String, dynamic> json) =>
      NotificationModel.fromJson(json);
}
