import 'package:clean_architecture_ess/data/entities/solar_flare_dto.dart';
import 'package:clean_architecture_ess/data/services/nasa_service.dart';
import 'package:clean_architecture_ess/domain/enteties/solar_flare.dart';
import 'package:clean_architecture_ess/domain/repos/solar_flare_repo.dart';

class SolarFlareRepoImpl extends SolarFlareRepo {
  final NasaService _nasaService;

  SolarFlareRepoImpl(this._nasaService);

  @override
  Future<List<SolarFlare>> getFlares({DateTime from, DateTime to}) async {
    final res = await _nasaService.getFlares(from, to);
    return res.map((e) => e.toModel()).toList();
  }
}
