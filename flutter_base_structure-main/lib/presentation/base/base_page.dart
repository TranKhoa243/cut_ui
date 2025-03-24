import 'package:flutter_base_structure/presentation/resources/index.dart';
import 'package:flutter_base_structure/presentation/styles/app_colors.dart';
import 'package:flutter_base_structure/presentation/utils/index.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:flutter_base_structure/core/error/failures.dart';
import 'package:flutter_base_structure/presentation/app/index.dart';
import 'package:flutter_base_structure/presentation/base/index.dart';
import 'package:flutter_base_structure/presentation/navigator/page_navigator.dart';
import 'package:provider/provider.dart';

import 'base_page_mixin.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_base_structure/presentation/styles/index.dart';
export 'package:flutter_base_structure/presentation/utils/input_formatter.dart';
export 'package:logger/logger.dart';
import 'package:flutter_base_structure/main/app_injector.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({
    required this.tag,
    Key? key,
  }) : super(key: key);
  final PageTag tag;
}

abstract class BasePageState<
    T extends BaseBloc<BaseEvent, BaseState>,
    P extends BasePage,
    R extends BaseRouter> extends State<P> with BasePageMixin {
  late T bloc;
  late BuildContext subContext;
  late R router;
  late ApplicationBloc applicationBloc;

  bool get willListenApplicationEvent => false;

  bool get resizeToAvoidBottomInset => false;

  double get getHeight =>
      MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      const Size.fromHeight(50).height -
      MediaQuery.of(context).padding.bottom;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc.onPageDidChangeDependenciesEvent(
        PageDidChangeDependenciesEvent(context: context));
  }

  @override
  void initState() {
    bloc = injector.get<T>();
    router = injector.get<R>();
    applicationBloc = BlocProvider.of<ApplicationBloc>(context);

    bloc.onPageInitStateEvent(PageInitStateEvent(context: context));
    super.initState();
  }

  navigateByEvent({required BaseEvent event}) async {
    final result =
        await router.onNavigateByEvent(context: context, event: event);
    bloc.onRouteNavigationResult(result);
  }

  Widget buildLayout(BuildContext context, BaseBloc bloc);

  void stateListenerHandler(BaseState state) async {
    if (state.failure != null) {
      if (state.failure!.code == "$ACCESS_TOKEN_EXPIRED_CODE" ||
          state.failure?.message == ACCESS_TOKEN_EXPIRED_MESSAGE) {
        final result = await showAlert(
          primaryColor: AppColors.primaryColor,
          dismissWithBackPress: false,
          context: context,
          message: AppLocalizations.shared.sessionExpiredMessage,
        );
        if (result) {
          if (context.mounted) {
            navigator.popToRoot(context: context);
            applicationBloc.dispatchEvent(AccessTokenExpiredEvent());
          }
        }
        return;
      }
      String message = '';
      Logger().d(
          '[Debug]: error ${state.failure?.message} code ${state.failure!.code}');
      if (state.failure!.message == INTERNET_ERROR_MESSAGE ||
          state.failure!.message == SOCKET_ERROR_MESSAGE) {
        message = AppLocalizations.shared.commonMessageConnectionError;
      } else if (state.failure!.message == SERVER_ERROR_MESSAGE) {
        message = AppLocalizations.shared.commonMessageServerMaintenance;
      } else if (state.failure?.code == null &&
          state.failure?.message == null) {
        message = UNKNOWN_ERROR_MESSAGE;
      } else {
        message = state.failure!.message ?? UNKNOWN_ERROR_MESSAGE;
      }
      showAlert(
        context: context,
        message: message,
        primaryColor: AppColors.primaryColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        bloc.onPageDidAppearEvent(
            PageDidAppearEvent(tag: widget.tag, context: context));
      },
      onFocusLost: () {
        bloc.onPageDidDisappearEvent(
            PageDidDisappearEvent(tag: widget.tag, context: context));
      },
      onForegroundLost: () {
        bloc.onAppEnterBackgroundEvent(
            AppEnterBackgroundEvent(context: context, tag: widget.tag));
      },
      onForegroundGained: () {
        bloc.onAppGainForegroundEvent(
            AppGainForegroundEvent(context: context, tag: widget.tag));
      },
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: Provider<R>(
          create: (context) => router,
          child: BlocProvider<T>(
            create: (context) => bloc,
            child: BlocListener<T, BaseState>(listener: (context, state) async {
              stateListenerHandler(state);
              final res = await router.onNavigateByState(
                  context: context, state: state);
              bloc.onRouteNavigationResult(res);
            }, child: LayoutBuilder(builder: (sub, _) {
              subContext = sub;
              return buildLayout(subContext, bloc);
            })),
          ),
        ),
      ),
    );
  }

  @override
  dispose() {
    bloc.dispose();
    bloc.close();
    super.dispose();
  }
}
