import 'package:clean_architecture_ess/domain/use_cases/solar_activities_use_case.dart';
import 'package:clean_architecture_ess/presentation/homestate.dart';

import 'repo_module.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(SolarActivitiesUseCase(
        RepoModule.geoStormRepo(), RepoModule.solarFlareRepo()));
  }
}
