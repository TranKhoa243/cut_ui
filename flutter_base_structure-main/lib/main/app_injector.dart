
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_base_structure/core/network/network_status.dart';
import 'package:flutter_base_structure/data/local/index.dart';
import 'package:flutter_base_structure/data/net/index.dart';
import 'package:flutter_base_structure/data/remote/api/index.dart';
import 'package:flutter_base_structure/data/remote/base/index.dart';
import 'package:flutter_base_structure/data/repository/user_repository_impl.dart';
import 'package:flutter_base_structure/domain/provider/index.dart';
import 'package:flutter_base_structure/domain/repository/index.dart';
import 'package:flutter_base_structure/presentation/utils/index.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt injector = GetIt.asNewInstance();
initInjector(){
  // Utils
  injector.registerFactory<LocalDataStorage>(() => SharePreferenceStorageImpl());
  injector.registerLazySingleton<SettingCache>(
        () => SettingCacheImpl(injector<LocalDataStorage>()),
  );/// đăng ký trước

  injector.registerLazySingleton<InternetConnectionChecker>(
          () => InternetConnectionChecker());
  injector.registerLazySingleton<Connectivity>(() => Connectivity());
  injector.registerLazySingleton<EndPointProvider>(() => EndPointProvider());
  injector.registerLazySingleton<EnviromentProvider>(
          () => EnvironmentProviderImpl());
  // injector
  //     .registerLazySingleton<NotifyCountProvider>(() => NotifyCountProvider());
  injector.registerLazySingleton<PushNotificationHandler>(
          () => PushNotificationHandler.shared);
  //API
  injector.registerFactory<BookingRequestHeaderBuilder>(() =>
      BookingRequestHeaderBuilder(
          tokenCache: injector(), apiConfig: injector()));
  injector.registerLazySingleton<ApiConfig>(() => ApiConfigImpl(
    enviromentProvider: injector(),
  ));
  injector.registerLazySingleton<NetworkStatus>(
          () => NetworkStatusImpl(injector(), injector()));
  injector.registerFactory<UserApi>(() => UserApiImpl());
  // Repository
  injector.registerFactory<UserRepository>(() => AuthenticationRepositoryImpl(
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
  ));
  // Cache
  injector
      .registerLazySingleton<AuthenCache>(() => AuthenCacheImpl(injector()));
  injector.registerLazySingleton<UserDataCache>(
          () => UserDataCacheImpl(injector()));
}