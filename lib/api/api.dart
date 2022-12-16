import 'package:bloc_project_structure/api/home/home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

/// Overall App All The API Object Create This Class.
class API {
    final HomeAPI homeAPI;

  API({@required Dio? dio, @required String? baseUrl})
      : homeAPI = HomeAPI(dio, baseUrl);
}
