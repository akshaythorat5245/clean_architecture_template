import 'package:clean_architecture_ess/data/entities/geo_storm_dto.dart';
import 'package:clean_architecture_ess/data/services/nasa_service.dart';
import 'package:clean_architecture_ess/domain/enteties/geo_storm.dart';
import 'package:clean_architecture_ess/domain/repos/geo_storm_repo.dart';

class GeoStormRepoImpl extends GeoStormRepo {
  final NasaService _nasaService;

  GeoStormRepoImpl(this._nasaService);

  @override
  Future<List<GeoStorm>> getStorms({DateTime from, DateTime to}) async {
    final res = await _nasaService.getGeoStorms(from, to);
    return res.map((e) => e.toModel()).toList();
  }
}
