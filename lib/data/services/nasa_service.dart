import 'dart:io';

import 'package:clean_architecture_ess/data/entities/geo_storm_dto.dart';
import 'package:clean_architecture_ess/data/entities/solar_flare_dto.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class NasaService {
  static const _BASE_URL = 'https://kauai.ccmc.gsfc.nasa.gov';

  final Dio dio = Dio(
    BaseOptions(baseUrl: _BASE_URL, receiveDataWhenStatusError: true),
  );

  Future<List<GeoStormDTO>> getGeoStorms(DateTime from, DateTime to) async {
    try {
      final response = await dio.get('/DONKI/WS/get/GST');

      return (response.data as List)
          .map((i) => GeoStormDTO.fromApi(i))
          .toList();
    } on DioError catch (e) {
      print(e.message);
      print(e.response.requestOptions);
    }
  }

  Future<List<SolarFlareDTO>> getFlares(DateTime from, DateTime to) async {
    final response = await dio.get('/DONKI/WS/get/FLR');

    return (response.data as List)
        .map((i) => SolarFlareDTO.fromApi(i))
        .toList();
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
