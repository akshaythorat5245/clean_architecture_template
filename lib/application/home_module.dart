import 'package:clean_architecture_ess/domain/use_cases/users_use_case.dart';
import 'package:clean_architecture_ess/presentation/homestate.dart';

import 'repo_module.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(UsersUseCase(RepoModule.userRepo()));
  }
}
