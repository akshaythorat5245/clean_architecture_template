import 'package:clean_architecture_ess/domain/enteties/user.dart';
import 'package:clean_architecture_ess/domain/repos/user_repo.dart';

class SolarActivitiesUseCase {
  final UserRepo _userRepo;

  SolarActivitiesUseCase(this._userRepo);

  Future<List<User>> getAllUsers() async {
    final users = await _userRepo.getUsersList();

    return users;
  }
}
