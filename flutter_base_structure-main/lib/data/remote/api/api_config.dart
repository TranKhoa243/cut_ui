import 'package:flutter_base_structure/domain/provider/environment_provider.dart';
import 'package:flutter_base_structure/domain/provider/index.dart';

const BASE_URL_DEV = '';
const BASE_URL_STG = '';
const BASE_URL_PROD = '';
const BASE_URL_LOGO = '';
const BASE_URL_POLICY = '';

const DEFAULT_API_KEY = "";
const UPLOAD_FILE_API_KEY = "";

abstract class ApiConfig {
  late String baseUrl;
  late int connectTimeout;
  late int receiveTimeout;
}

class ApiConfigImpl extends ApiConfig {
  EnviromentProvider enviromentProvider;
  ApiConfigImpl({
    required this.enviromentProvider,
  });

  @override
  String get baseUrl {
    final evn = enviromentProvider.getCurrentFlavor();
    switch (evn) {
      case EnviromentFlavor.dev:
        return BASE_URL_DEV;
      case EnviromentFlavor.verify:
        return BASE_URL_DEV;
      case EnviromentFlavor.stg:
        return BASE_URL_STG;
      case EnviromentFlavor.prod:
        return BASE_URL_PROD;
    }
  }

  @override
  int get connectTimeout => 30000;

  @override
  int get receiveTimeout => 30000;
}
