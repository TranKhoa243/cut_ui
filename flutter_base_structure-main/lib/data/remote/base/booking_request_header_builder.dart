import 'package:flutter_base_structure/data/local/index.dart';
import 'package:flutter_base_structure/data/remote/api/index.dart';
import 'package:logger/logger.dart';

class BookingRequestHeaderBuilder {
  AuthenCache tokenCache;
  ApiConfig apiConfig;

  BookingRequestHeaderBuilder({
    required this.tokenCache,
    required this.apiConfig,
  });

  Map<String, String> _defaultHeader(
      {String? token,
      String contentType = 'application/json',
      String apiKey = ''}) {
    Logger().d("token: $token");
    var header = {'content-type': contentType, 'apikey': apiKey};
    if (token?.isNotEmpty ?? false) {
      header['UserAuthorization'] = 'Bearer $token';
    }

    return header;
  }

  Future<String> _validateAccessToken(AuthenCache authenCache) async {
    String? token = (await authenCache.getCachedToken())?.token;
    return token ?? '';
  }

  Future<Map<String, String>> buildHeader() async {
    String accesstoken;
    accesstoken = await _validateAccessToken(tokenCache);
    var header = _defaultHeader(token: accesstoken, apiKey: DEFAULT_API_KEY);
    return header;
  }
}
