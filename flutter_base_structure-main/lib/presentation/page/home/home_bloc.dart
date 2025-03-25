import 'dart:async';

import 'package:flutter_base_structure/presentation/base/base_bloc.dart';
import 'package:flutter_base_structure/presentation/base/base_event.dart';
import 'package:flutter_base_structure/presentation/page/home/home_state.dart';

class HomeBloc extends BaseBloc<BaseEvent, HomeState> {

  HomeBloc()
      : super(initState: HomeState()) {
  }

  @override
  void onPageInitStateEvent(PageInitStateEvent event) {
    super.onPageInitStateEvent(event);
  }

  @override
  void dispose() {}

}
