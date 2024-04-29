import 'package:dio/dio.dart';
import 'package:learning_course_app/common/values/constant.dart';
import 'package:learning_course_app/global.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstant.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );

    dio = Dio(options);
  }

  //
  Future post(
    String path, {
    dynamic myData,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeaders();

    //check
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(
      path,
      data: myData,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    print("My Response Data is ${response.toString()}");
    print("My Status Code id ${response.statusCode}");
    return response.data;
  }

  //
  Map<String, dynamic>? getAuthorizationHeaders() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();

    //
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }
}
