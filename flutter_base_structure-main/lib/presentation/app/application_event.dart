import 'package:flutter_base_structure/presentation/base/base_event.dart';

abstract class ApplicationEvent extends BaseEvent {}

class LoadingEvent extends ApplicationEvent {}

class AppLaunched extends ApplicationEvent {}

class AccessTokenExpiredEvent extends ApplicationEvent {}

class ReloadUiWithNewDataEvent extends ApplicationEvent {
  dynamic data;

  ReloadUiWithNewDataEvent({this.data});
}

class NotificationClickEvent extends ApplicationEvent {
  final String sendNotifyCd;

  NotificationClickEvent({required this.sendNotifyCd});
}

class RegisterSuccessEvent extends ApplicationEvent {
  final bool hasUserData;
  RegisterSuccessEvent({required this.hasUserData});
}

class LoginSuccessEvent extends ApplicationEvent {
  final bool? goToLinkedCard;
  LoginSuccessEvent({this.goToLinkedCard});
}

class SignUpSuccessEvent extends ApplicationEvent {
  final String? phone;
  final String? pass;

  SignUpSuccessEvent({this.pass, this.phone});
}


class NeedToRegisterInfoEvent extends ApplicationEvent {
  final String? userId;
  NeedToRegisterInfoEvent({this.userId});
}