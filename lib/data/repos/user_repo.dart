import 'package:clean_architecture_ess/data/services/nasa_service.dart';
import 'package:clean_architecture_ess/domain/enteties/user.dart';
import 'package:clean_architecture_ess/domain/repos/user_repo.dart';

class UserRepoImpl extends UserRepo {
  final NasaService _nasaService;

  UserRepoImpl(this._nasaService);

  @override
  Future<List<User>> getUsersList() async {
    final res = await _nasaService.getUserList();
    if (res != null && res.isNotEmpty)
      return res.map((e) => e.toModel()).toList();
  }
}
