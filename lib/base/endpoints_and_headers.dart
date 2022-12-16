import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Secure Base Url Get This Class.
class KMEndpoints {
  static String? baseUrl = dotenv.get('CLOUD_BASE_URL_DEV',fallback: 'API_URL not found');
  static String? entries = dotenv.get('CLOUD_ENTRIES_ENDPOINT',fallback: 'API_URL not found');
}

/// Dio Header RequireToken Variable.
class KMInterceptorHeaders {
  static String requiresToken = 'requiresToken';
}

class KMHeaders {
  static String xFirebaseToken = 'X-Firebase-Token';
  static String deviceOsClientType = 'deviceOsClientType';
  static String deviceUuId = 'deviceUuId';
  static String subscribe = 'subscribe';
  static String userDeviceToken = 'userDeviceToken';
}

