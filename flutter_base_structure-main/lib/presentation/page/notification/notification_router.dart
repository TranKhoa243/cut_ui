import 'package:flutter/material.dart';
import '../../base/index.dart';
import 'notification_event.dart';
class NotificationRouter extends BaseRouter {
  @override
  onNavigateByEvent({required BuildContext context, required BaseEvent event}) {
    if(event is NotificationBackEvent){
      navigator.popBack(context: context);
    }
  }
  @override
  onNavigateByState({required BuildContext context, required BaseState state}) {

  }
}