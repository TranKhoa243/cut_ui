import 'package:flutter_base_structure/core/error/failures.dart';
import 'package:flutter_base_structure/presentation/base/base_state.dart';

class ApplicationState extends BaseState {
  final AppLaunchTag tag;
  final Map<String, dynamic>? additionalData;

  ApplicationState({
    required this.tag,
    this.additionalData,
    Failure? failure,
    LoadingStatus? status,
  }) : super(failure: failure, loadingStatus: status ?? LoadingStatus.none);

  ApplicationState copyWith({
    AppLaunchTag? tag,
    Failure? failure,
    Map<String, dynamic>? additionalData,
    LoadingStatus? status,
  }) {
    return ApplicationState(
        tag: tag ?? this.tag,
        additionalData: additionalData ?? this.additionalData,
        failure: failure,
        status: status);
  }
}

const APP_LAUNCH_ERROR_MESSAGE = "application cannot start";

enum AppLaunchTag { splash, verifyphone, main, policy, updateUser }
