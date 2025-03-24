import 'package:flutter_base_structure/main/app_injector.dart';
import 'package:flutter_base_structure/core/network/network_status.dart';
import 'package:flutter_base_structure/data/net/api_connection.dart';
import 'package:flutter_base_structure/data/net/endpoint_provider.dart';
import 'package:flutter_base_structure/data/remote/api/index.dart';
import 'booking_request_header_builder.dart';

abstract class BaseApi {
  NetworkStatus? networkStatus;
  EndPointProvider? endPointProvider;
  BookingRequestHeaderBuilder? headerBuilder;
  ApiConfig? apiConfig;

  BaseApi({
    ApiConfig? config,
    EndPointProvider? provider,
    NetworkStatus? status,
    BookingRequestHeaderBuilder? builder,
  }) {
    networkStatus = status ?? injector.get<NetworkStatus>();
    headerBuilder = builder ?? injector.get<BookingRequestHeaderBuilder>();
    endPointProvider = provider ?? injector.get<EndPointProvider>();
    apiConfig = config ?? injector.get<ApiConfig>();
  }

  Future<ApiConnection> initConnection() async {
    final header = await headerBuilder?.buildHeader();
    return ApiConnection(
      apiConfig!,
      header ?? {},
      networkStatus: networkStatus,
    );
  }
}
