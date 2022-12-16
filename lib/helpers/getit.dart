import 'package:bloc_project_structure/api/api.dart';
import 'package:bloc_project_structure/base/endpoints_and_headers.dart';
import 'package:bloc_project_structure/manager/manager.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';

class GetItHelper {
  /// Init Method To Services Locator
  static void init() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton(() => Manager());

    var dio = Dio(BaseOptions(
      connectTimeout: 20000,
      receiveTimeout: 20000,
      validateStatus: (status) {
        return true;
      },
    ));

    dio.interceptors.add(
      InterceptorsWrapper(
       // onRequest: (RequestOptions options,_) => requestInterceptor(options),
       // onResponse: (Response response,_) => responseInterceptor(response),
        onError: (DioError dioError,_) => errorInterceptor(dioError),
      ),
    );

    getIt.registerLazySingleton(() => API(dio: dio, baseUrl: KMEndpoints.baseUrl));
  }

  static requestInterceptor(RequestOptions options) async {
    if (options.headers.containsKey(KMInterceptorHeaders.requiresToken)) {
      //remove the auxiliary header
      options.headers.remove(KMInterceptorHeaders.requiresToken);
      String? idToken = await FirebaseMessaging.instance.getToken();
       print('firebaseIdToken :  ${idToken}');
       options.headers.addAll({KMHeaders.xFirebaseToken: idToken});

      return options;
    }
  }

  static responseInterceptor(Response response) {
    print("------ DIO RESPONSE -----  ${response.requestOptions.uri} ");
    return response;
  }

  static errorInterceptor(DioError dioError) {
    
    print('-------------- DIO ERROR ---------------');
    print('${dioError.requestOptions.uri}   ${dioError.requestOptions.data}');
    print(dioError.message);
    print('_RESPONSE');
    print(dioError.response);

    if (dioError.type == DioErrorType.receiveTimeout ||
        dioError.type == DioErrorType.connectTimeout) {
      return Response(data: {
        'success': false,
        'message': 'You have an error with connection.'
      },requestOptions: RequestOptions(path: ''));
    }

    if (dioError.error.runtimeType == FormatException) {
      if ((dioError.error as FormatException)
          .source
          .contains("Error reading session.")) {
        //GetIt.instance<Manager>().auth.signOut();
      }
    }

    return dioError.response;
  }
}
