import 'package:flutter_base_structure/presentation/base/base_event.dart';

abstract class DetailEventEvent extends BaseEvent {}

class GetDetailEventEvent extends DetailEventEvent{}

class DetailEventBackEvent extends DetailEventEvent{}