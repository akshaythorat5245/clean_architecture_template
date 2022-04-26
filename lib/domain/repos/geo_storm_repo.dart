import 'package:clean_architecture_ess/domain/enteties/geo_storm.dart';
import 'package:meta/meta.dart';

abstract class GeoStormRepo {
  Future<List<GeoStorm>> getStorms({
    @required DateTime from,
    @required DateTime to,
  });
}
