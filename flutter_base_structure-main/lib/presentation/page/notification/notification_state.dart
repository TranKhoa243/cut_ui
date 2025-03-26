import 'package:flutter_base_structure/domain/model/notification_model/notification_model.dart';
import 'package:flutter_base_structure/domain/model/notification_model/notification_model2.dart';
import 'package:flutter_base_structure/presentation/base/index.dart';

class NotificationState extends BaseState {}

class NotificationLoading extends NotificationState {}

class NotificationLoadSuccess extends NotificationState {
  final List<NotificationModel2> notifications;

  NotificationLoadSuccess(this.notifications);
}

class NotificationLoadError extends NotificationState {
  final String message;

  NotificationLoadError(this.message);
}
