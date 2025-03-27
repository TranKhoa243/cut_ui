import 'package:flutter/material.dart';
import '../../base/index.dart';
import 'detail_event_event.dart';
class DetailEventRouter extends BaseRouter {
  @override
  onNavigateByEvent({required BuildContext context, required BaseEvent event}) {
    if(event is DetailEventBackEvent){
      navigator.popBack(context: context);
    }
  }
  @override
  onNavigateByState({required BuildContext context, required BaseState state}) {

  }
}