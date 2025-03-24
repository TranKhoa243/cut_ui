export 'package:flutter_base_structure/main/app_injector.dart';
import 'package:flutter_base_structure/presentation/base/base_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_structure/presentation/app/application_bloc.dart';
import 'base_state.dart';

export 'package:flutter_base_structure/presentation/monitor/bloc_monitor_delegate.dart';
export 'package:flutter_base_structure/presentation/app/application_event.dart';
export 'package:flutter_base_structure/presentation/utils/page_tag.dart';
export 'package:flutter_base_structure/presentation/navigator/page_navigator.dart';

abstract class BaseRouter {
  ApplicationBloc applicationBloc(BuildContext context) {
    final bloc = BlocProvider.of<ApplicationBloc>(context);
    return bloc;
  }

  dynamic onNavigateByState(
      {required BuildContext context, required BaseState state}) {}

  dynamic onNavigateByEvent(
      {required BuildContext context, required BaseEvent event}) {}
}
