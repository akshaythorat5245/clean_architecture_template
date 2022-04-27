import 'package:clean_architecture_ess/domain/enteties/user.dart';
import 'package:clean_architecture_ess/domain/use_cases/users_use_case.dart';
import 'package:mobx/mobx.dart';

part 'createuserstate.g.dart';

class CreateUserState = CreateUserStateBase with _$CreateUserState;

abstract class CreateUserStateBase with Store {
  CreateUserStateBase(this._useCase) {}

  final UsersUseCase _useCase;

  @observable
  bool isLoading = false;

  @observable
  List<User> userList;

  @action
  Future<void> getUserList() async {
    isLoading = true;
    userList = await _useCase.getAllUsers();
    isLoading = false;
  }
}
