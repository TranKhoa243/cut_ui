import 'dart:io';
import 'dart:ui';

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/page/home/home_page.dart';
import 'package:flutter_base_structure/presentation/page/home/item/device_utils.dart';
import 'package:flutter_base_structure/presentation/page/home/item/routes.dart';
import 'package:flutter_base_structure/presentation/page/notification/notification_page.dart';
import 'package:flutter_base_structure/presentation/page/splash/splash_page.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_base_structure/data/local/index.dart';
import 'package:flutter_base_structure/data/net/index.dart';
import 'package:flutter_base_structure/domain/provider/index.dart';
import 'package:flutter_base_structure/domain/repository/index.dart';
import 'package:flutter_base_structure/domain/usecase/index.dart';
import 'package:flutter_base_structure/presentation/app/index.dart';
import 'package:flutter_base_structure/presentation/base/index.dart';
// import 'package:flutter_base_structure/presentation/page/card_detail/index.dart';
// import 'package:flutter_base_structure/presentation/page/main/index.dart';
// import 'package:flutter_base_structure/presentation/page/my_wallet/index.dart';
// import 'package:flutter_base_structure/presentation/page/policy/index.dart';
// import 'package:flutter_base_structure/presentation/page/verify_phone/index.dart';
import 'package:flutter_base_structure/presentation/resources/index.dart';
import 'package:flutter_base_structure/presentation/utils/push_notification_handler.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';


late ApplicationBloc appBloc;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    appBloc.dispatchEvent(AppLaunched());
  }

  @override
  Widget build(BuildContext context) {
    DeviceUtils.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: CoreRoutes.navigatorKey!,
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.transparent),
      ),
      home: BlocBuilder<ApplicationBloc, BaseState>(
          bloc: appBloc,
          builder: (context, state) {
            const loadingView = SplashPage();
            if (state is ApplicationState) {
              switch (state.tag) {
                case AppLaunchTag.verifyphone:
                  // return const VerifyPhonePage(
                  //   pageTag: PageTag.verifyphone,
                  // );
                case AppLaunchTag.main:
                  return  HomePage(tag: PageTag.main);
                case AppLaunchTag.policy:
                  // return const PolicyPage(
                  //   pageTag: PageTag.policy,
                  //   isShowBtn: true,
                  // );
                default:
                  return loadingView;
              }
            }
            // loading view
            return loadingView;
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // NotifyProvider.shared.dispose();
  }
}

class AppEntry {
  runWithFlavor({required EnviromentFlavor flavor}) async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = blocMonitorDelegate;/// quản lý vòng đòi của bloc
    HttpOverrides.global = MyHttpOverrides();///cấu hình các http
    _setupBackgrounNofication();

    // await Firebase.initializeApp();

    await initializeDateFormatting('vi_VN');
    AppLocalizations.shared.reloadLanguageBundle(languageCode: 'vi');
    await initInjector();
    injector.get<EnviromentProvider>().setFlavor(flavor: flavor);
    await Future.wait([
      _setupAndroidInAppWebview(),

      injector.get<EndPointProvider>().load(),
      // injector.get<UserDataCache>().loadCacheData(),

    ]);

    appBloc = ApplicationBloc(
        repository: injector<UserRepository>(),
        // logoutUseCase: injector<LogoutUseCase>(),
        // getUserUseCase: injector<GetUserUseCase>(),
        // settingCache: injector<SettingCache>(),
        // userCache: injector<UserDataCache>()
    );

    runApp(
      MultiProvider(
        providers: [
          // Provider<NotifyCountProvider>(create: (_) => injector()),
          Provider<UserDataCache>(create: (_) => injector()),
          Provider<AuthenCache>(create: (_) => injector()),

        ],
        child: BlocProvider<ApplicationBloc>(
          create: (BuildContext context) => appBloc,
          child: const MyApp(),
        ),
      ),
    );
  }

  Future<void> _setupAndroidInAppWebview() async {
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
      var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
          AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
      var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
          AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);
      if (swAvailable && swInterceptAvailable) {
        AndroidServiceWorkerController serviceWorkerController =
        AndroidServiceWorkerController.instance();
        await serviceWorkerController
            .setServiceWorkerClient(AndroidServiceWorkerClient(
          shouldInterceptRequest: (request) async {
            return null;
          },
        ));
      }
    }
  }

  _setupBackgrounNofication() {
    // push-notification handler when app in background
    IsolateNameServer.registerPortWithName(
      backgroundMessagePort.sendPort,
      backgroundMessageIsolateName,
    );

    backgroundMessagePort.listen(backgroundMessagePortHandler);
  }

}

class MyHttpOverrides extends HttpOverrides {
  // @override
  // HttpClient createHttpClient(SecurityContext? context) {
  //   HttpClient client = super.createHttpClient(context);

  //   client.badCertificateCallback =
  //       (X509Certificate cert, String host, int port) => true;
  //   return client;
  // }

  // CertificateCallBack get callback  =

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback = (cert, String host, int port) {
      Logger().d('SOCKET.IO host: $host');
      return true;
    };
    return client;
  }
}
