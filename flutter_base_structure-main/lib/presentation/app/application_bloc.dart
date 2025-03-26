import 'dart:async';
import 'package:flutter_base_structure/core/error/exceptions.dart';
import 'package:flutter_base_structure/core/error/failures.dart';
import 'package:flutter_base_structure/data/local/index.dart';
import 'package:flutter_base_structure/domain/repository/index.dart';
import 'package:flutter_base_structure/domain/usecase/index.dart';
import 'package:flutter_base_structure/presentation/app/index.dart';
import 'package:flutter_base_structure/presentation/base/index.dart';
import 'package:rxdart/subjects.dart';

class ApplicationBloc extends BaseBloc<ApplicationEvent, ApplicationState> {
  UserRepository repository;
  // LogoutUseCase logoutUseCase;
  // final GetUserUseCase getUserUseCase;
  // final SettingCache settingCache;
  // final UserDataCache userCache;

  final PublishSubject<BaseEvent> _broadcastEventManager =
      PublishSubject<BaseEvent>();

  ApplicationBloc(
      {
        required this.repository,
      //   required this.logoutUseCase,
      //   required this.getUserUseCase,
      //   required this.userCache,
      //   required this.settingCache
      }
      )
      : super(initState: ApplicationState(tag: AppLaunchTag.main)) {
    on<AppLaunched>(_onAppLaunchHandler);
    // on<LoginSuccessEvent>(_onLoginSuccessHandler);
    // on<AccessTokenExpiredEvent>(_onAccessTokenExpiredHandler);
    // on<LogoutSuccessEvent>((_, emitter) =>
    //     emitter(ApplicationState(tag: AppLaunchTag.verifyphone)));
    // on<NeedToRegisterInfoEvent>(
    //       (event, emit) => emit(ApplicationState(
    //       tag: AppLaunchTag.updateUser,
    //       additionalData: {'userId': event.userId})),
    // );
  }

  // _onAccessTokenExpiredHandler(
  //     AccessTokenExpiredEvent event, Emitter<ApplicationState> emitter) async {
  //   final logoutResult = await logoutUseCase.logout(isRemoteLogout: false);
  //   emitter(logoutResult.fold(
  //       (l) => ApplicationState(tag: AppLaunchTag.verifyphone, failure: l),
  //       (r) => ApplicationState(
  //             tag: AppLaunchTag.verifyphone,
  //           )));
  // }
  //
  // _onLoginSuccessHandler(
  //     LoginSuccessEvent event, Emitter<ApplicationState> emitter) async {
  //   emitter(ApplicationState(tag: AppLaunchTag.main));
  // }
  //
  _onAppLaunchHandler(
      AppLaunched event, Emitter<ApplicationState> emitter) async {
    AppLaunchTag tag = AppLaunchTag.verifyphone;
    emitter(state.copyWith(status: LoadingStatus.loading));
    emitter(state.copyWith(tag: AppLaunchTag.main));
    // try {
    //   var isLogged = await repository.isLogged();
    //   if (isLogged) {
    //     // await fetchUserData();
    //     final user = await userCache.getCacheUser();
    //
    //     ///todo need to update info to see if user has data
    //     if (user?.userType != null) {
    //       tag = AppLaunchTag.main;
    //     }
    //   } else {
    //     final disShowPolicy = await settingCache.didShowPolicyPage();
    //     tag = disShowPolicy ? AppLaunchTag.verifyphone : AppLaunchTag.policy;
    //   }
    //   emitter(state.copyWith(tag: tag));
    // } on RemoteException catch (ex) {
    //   emitter(state.copyWith(
    //       failure: PlatformFailure(msg: ex.errorMessage),
    //       tag: (ex.errorCode ?? 0) == "$ACCESS_TOKEN_EXPIRED_CODE"
    //           ? AppLaunchTag.verifyphone
    //           : tag));
    // } catch (ex) {
    //   emitter(state.copyWith(
    //       failure: PlatformFailure(msg: SERVER_ERROR_MESSAGE), tag: tag));
    // }
  }
  //
  // Future<void> fetchUserData() async {
  //   //pre fetch user data
  //   await getUserUseCase.getUser();
  // }

  @override
  void dispose() {
    _broadcastEventManager.close();
  }
}

//broadcast event
extension AppEventCenter on ApplicationBloc {
  Stream<BaseEvent> get broadcastEventStream => _broadcastEventManager.stream;

  void postBroadcastEvent(BaseEvent event) {
    _broadcastEventManager.add(event);
  }
}
