import 'package:clean_architecture_ess/data/repos/user_repo.dart';
import 'package:clean_architecture_ess/domain/repos/user_repo.dart';
import 'package:clean_architecture_ess/data/services/nasa_service.dart';

class RepoModule {
  static UserRepo _userRepo;

  static NasaService _nasaService = NasaService();

  static UserRepo userRepo() {
    if (_userRepo == null) {
      _userRepo = UserRepoImpl(_nasaService);
    }
    return _userRepo;
  }
}
