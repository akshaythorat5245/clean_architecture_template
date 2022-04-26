import 'package:clean_architecture_ess/domain/enteties/solar_activities.dart';
import 'package:clean_architecture_ess/domain/use_cases/solar_activities_use_case.dart';
import 'package:mobx/mobx.dart';

part 'homestate.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._useCase) {
    getSolarActivities();
  }

  final SolarActivitiesUseCase _useCase;

  @observable
  SolarActivities solarActivities;

  @observable
  bool isLoading = false;

  @action
  Future<void> getSolarActivities() async {
    isLoading = true;
    solarActivities = await _useCase.getLastSolarActivities();
    isLoading = false;
  }
}
