import 'package:clean_architecture_ess/domain/enteties/user.dart';
import 'package:clean_architecture_ess/domain/use_cases/users_use_case.dart';
import 'package:mobx/mobx.dart';

part 'createuserstate.g.dart';

class CreateUserState = CreateUserStateBase with _$CreateUserState;

abstract class CreateUserStateBase with Store {
  CreateUserStateBase(this._useCase) {}

  String genderdropdownvalue = 'Male';
  var genderItems = [
    'Male',
    'Female',
  ];

  String statusdropdownvalue = 'Active';
  var statusItems = [
    'Active',
    'Inactive',
  ];

  String name = "";
  String email = "";

  final UsersUseCase _useCase;

  @observable
  bool isLoading = false;

  @observable
  bool isSucess = false;

  @action
  Future<bool> createUser() async {
    isLoading = true;
    isSucess = await _useCase.createUser(
        name, email, genderdropdownvalue, statusdropdownvalue);
    isLoading = false;
  }
}
