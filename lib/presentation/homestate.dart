import 'package:clean_architecture_ess/domain/enteties/user.dart';
import 'package:clean_architecture_ess/domain/use_cases/users_use_case.dart';
import 'package:mobx/mobx.dart';

part 'homestate.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._useCase) {
    //getSolarActivities();
    getUserList();
  }

  final UsersUseCase _useCase;

  @observable
  bool isLoading = false;

  // @action
  // Future<void> getSolarActivities() async {
  //   isLoading = true;
  //   solarActivities = await _useCase.getLastSolarActivities();
  //   isLoading = false;
  // }

  @observable
  List<User> userList;

  @action
  Future<void> getUserList() async {
    isLoading = true;
    userList = await _useCase.getAllUsers();
    isLoading = false;
  }

  @action
  Future<bool> deleteUser(int id) async {
    isLoading = true;
    var isDeleted = await _useCase.deleteUser(id);
    isLoading = false;
    if (isDeleted) {
      getUserList();
    }
  }
}
