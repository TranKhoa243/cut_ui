import 'package:flutter_base_structure/presentation/base/base_event.dart';

abstract class NotificationEvent extends BaseEvent {}

class GetNotificationEvent extends NotificationEvent{}

class NotificationBackEvent extends NotificationEvent{}