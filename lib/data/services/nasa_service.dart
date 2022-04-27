import 'dart:io';
import 'package:clean_architecture_ess/data/entities/user_dto.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:intl/intl.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class NasaService {
  static const _BASE_URL = 'https://gorest.co.in';

  final dio = Dio()
    ..options.baseUrl = _BASE_URL
    ..options.responseType = ResponseType.json
    ..options.contentType = "application/json"
    ..options.connectTimeout = 10000
    ..interceptors.add(LogInterceptor());
  // ..httpClientAdapter = Http2Adapter(
  //   ConnectionManager(
  //       idleTimeout: 20000,
  //       // Ignore bad certificate
  //       onClientCreate: (_, config) => {
  //             //config.context?.setTrustedCertificatesBytes(File("/assets/certs/wildcard.pem").readAsBytesSync()),
  //             config.onBadCertificate =
  //                 (_) => true, // <-- ignored, should bypass check
  //           }),
  // );

  Future<List<UserDTO>> getUserList() async {
    try {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      final response = await dio.get('/public/v2/users/');
      return (response.data as List).map((i) => UserDTO.fromJson(i)).toList();
    } on DioError catch (e) {
      print("Error " + e.message);
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
