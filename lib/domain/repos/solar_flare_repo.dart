import 'package:clean_architecture_ess/domain/enteties/solar_flare.dart';
import 'package:meta/meta.dart';

abstract class SolarFlareRepo {
  Future<List<SolarFlare>> getFlares({
    @required DateTime from,
    @required DateTime to,
  });
}
