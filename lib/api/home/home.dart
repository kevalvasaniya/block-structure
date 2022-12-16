import 'package:bloc_project_structure/base/endpoints_and_headers.dart';
import 'package:dio/dio.dart';

/// Home Screen All API Use In This Class.
class HomeAPI {
  final Dio? _dio;
  final String? _baseUrl;

  HomeAPI(this._dio, this._baseUrl);

  /// Cloud User Endpoint
  final String _endpoint = KMEndpoints.entries!;

  /// Retrieves all Data In User.
  Future<HomeResponse<List<dynamic>>> getHomeAPI() async {
    Map<String, dynamic> headers = {KMInterceptorHeaders.requiresToken: true};
    Response response = await _dio!.get(
      _baseUrl! + _endpoint,
      options: Options(headers: headers),
    );
    List<dynamic>? responseData;
    String? errorMessage;
    if (response.statusCode == 200) {
      responseData = response.data;
    } else {
      errorMessage = response.statusMessage!;
    }
    return HomeResponse<List<dynamic>>(
        response: responseData, errorMessage: errorMessage);
  }

}

class HomeResponse<T> {
  final T? response;
  final String? errorMessage;

  HomeResponse({this.response, this.errorMessage});
}
