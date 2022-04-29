import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:clean_architecture_ess/data/entities/user_dto.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'dart:convert' as convert;

class UserService {
  static const _BASE_URL = 'https://gorest.co.in';

  final dio = Dio()
    ..options.baseUrl = _BASE_URL
    ..options.connectTimeout = 10000
    ..interceptors.add(LogInterceptor(
        requestBody: true,
        request: true,
        requestHeader: true,
        responseBody: true));
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

  Future<bool> createUser(
      String name, String email, String gender, String status) async {
    try {
      var params = FormData.fromMap({
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
      });

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      final response = await dio.post(
        '/public/v2/users/',
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer d768f41a00836dd3b6d23c3d72a62cd0908793d0cdfa77a76265bbee6861aba1"
        }),
        data: params,
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        print(response.data.toString());
        return false;
      }
    } on DioError catch (e) {
      print("Error " + e.message);
      return false;
    }
  }

  Future<UserDTO> createUserwithObj(
      String name, String email, String gender, String status) async {
    try {
      var params = FormData.fromMap({
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
      });

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      final response = await dio.post(
        '/public/v2/users/',
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer d768f41a00836dd3b6d23c3d72a62cd0908793d0cdfa77a76265bbee6861aba1"
        }),
        data: params,
      );

      if (response.statusCode == 201) {
        return UserDTO.fromJson(response.data);
      }
    } on DioError catch (e) {
      print("Error " + e.message);
    }
  }

  Future<bool> deleteUser(int id) async {
    try {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      final response = await dio.delete(
        '/public/v2/users/' + id.toString(),
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer d768f41a00836dd3b6d23c3d72a62cd0908793d0cdfa77a76265bbee6861aba1"
        }),
      );

      if (response.statusCode == 204) {
        return true;
      } else {
        print(response.data.toString());
        return false;
      }
    } on DioError catch (e) {
      print("Error " + e.message);
      return false;
    }
  }

  Future<bool> updateUser(UserDTO user) async {
    try {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      var params = FormData.fromMap({
        "name": user.name,
        "email": user.email,
        "gender": user.gender,
        "status": user.status,
      });

      final response = await dio.put('/public/v2/users/' + user.id.toString(),
          options: Options(headers: {
            HttpHeaders.authorizationHeader:
                "Bearer d768f41a00836dd3b6d23c3d72a62cd0908793d0cdfa77a76265bbee6861aba1"
          }),
          data: params);

      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        return true;
      } else {
        print(response.data.toString());
        return false;
      }
    } on DioError catch (e) {
      print("Error " + e.message);
      return false;
    }
  }
}
