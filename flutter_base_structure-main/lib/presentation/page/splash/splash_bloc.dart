import 'package:flutter_base_structure/core/error/failures.dart';
import 'package:flutter_base_structure/domain/model/index.dart';
import 'package:flutter_base_structure/domain/usecase/index.dart';
import 'package:flutter_base_structure/presentation/base/index.dart';
// import 'package:flutter_base_structure/presentation/page/login/index.dart';
import 'package:flutter_base_structure/presentation/page/splash/index.dart';
import 'package:flutter_base_structure/presentation/resources/index.dart';
import 'package:flutter_base_structure/presentation/utils/push_notification_handler.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashBloc extends BaseBloc<BaseEvent, SplashState> {
  // AuthenticationUseCases _authenticationUseCases;
  // LogoutUseCase logoutUseCase;

  SplashBloc(
    // this._authenticationUseCases,
    // this.logoutUseCase,
  ) : super(initState: SplashState()) {}

  @override
  dispose() {}

  @override
  void onPageInitStateEvent(PageInitStateEvent event) {
    super.onPageInitStateEvent(event);
  }
}
