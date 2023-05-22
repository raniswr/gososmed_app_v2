import 'dart:developer';
import 'package:gososmed_app/utils/storage_names.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:gososmed_app/utils/const.dart';

class ApiInterface {
  late Dio api;
  static final ApiInterface _instance = ApiInterface._privateConstructor();
  factory ApiInterface() => _instance;

  static ApiInterface get instance => _instance;

  ApiInterface._privateConstructor() {
    BaseOptions options = BaseOptions(
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      baseUrl: Const.apiURL,
    );

    api = Dio(options);

    api.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          var sharePreference = await SharedPreferences.getInstance();
          String? token = sharePreference.getString(StorageNames.token);
          if (token != null) {
            options.headers.addAll({"Authorization": "Bearer $token"});
          }
          handler.next(options);
        },
        onError: (e, handler) async {
          log("onError dio interceptor- $e");
          Response? response = e.response;
          api.options.queryParameters.clear();
          if (response?.statusCode == HttpStatus.unauthorized || response?.statusCode == HttpStatus.forbidden) {
            var sharePreference = await SharedPreferences.getInstance();
            String? token = sharePreference.getString(StorageNames.token);
            if (token != null) {
              if (response?.statusCode == 401) {
                log("token expired");
              }
            }
          }
          try {
            handler.next(e);
          } catch (e) {
            log("error next api");
          }
        },
        onResponse: (e, handler) {
          api.options.queryParameters.clear();
          return handler.next(e);
        },
      ),
    );
  }
}
