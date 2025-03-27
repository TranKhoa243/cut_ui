import 'package:flutter_base_structure/presentation/base/index.dart';

class DetailEventState extends BaseState {}

class DetailEventLoading extends DetailEventState {}

class DetailEventLoadSuccess extends DetailEventState {

  DetailEventLoadSuccess();
}

class DetailEventLoadError extends DetailEventState {
  final String message;

  DetailEventLoadError(this.message);
}
