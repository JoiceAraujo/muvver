import 'package:dio/dio.dart';

import 'api_host.dart';
import 'endpoint.dart';

typedef Success = void Function(dynamic);
typedef Failure = void Function(DioError);

class ApiProvider {
  final Dio _dio = Dio();

  Future<void> request({required Endpoint endpoint, required Success success, required Failure failure}) async {
    _dio.options.method = endpoint.method;
    _dio.options.contentType = endpoint.contentType;
    _dio.options.baseUrl = '${ApiHost.baseUrl}/maps/api';
    _dio.options.queryParameters = ApiHost.authenticationParams;

    try {
      final response = await _dio.request(endpoint.path, data: endpoint.data);
      success(response.data);
    } on DioError catch (e) {
      failure(e);
    }
  }
}
