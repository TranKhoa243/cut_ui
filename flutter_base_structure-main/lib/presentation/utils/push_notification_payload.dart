import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_base_structure/domain/model/notification_model/notification_model.dart';
import 'dart:convert';
import '../../domain/model/index.dart';

class PushNotificationPayload {
  NotificationModel? data;
  String? title;
  String? body;

  PushNotificationPayload.fromJson(dynamic _data,
      {RemoteNotification? notification}) {
    // final json = jsonDecode(_data['data']);
    // data = NotificationModel.fromJson(json);
    data = NotificationModel.fromJson(_data);
    title = notification?.title;
    body = notification?.body;
  }
}
