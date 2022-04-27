import 'package:clean_architecture_ess/domain/use_cases/users_use_case.dart';
import 'package:clean_architecture_ess/presentation/create_user/createuserstate.dart';


import 'repo_module.dart';

class CreateUserModule {
  static CreateUserState userState() {
    return CreateUserState(UsersUseCase(RepoModule.userRepo()));
  }
}