import 'package:clean_architecture_ess/data/services/user_service.dart';
import 'package:clean_architecture_ess/domain/enteties/user.dart';
import 'package:clean_architecture_ess/domain/repos/user_repo.dart';

class UserRepoImpl extends UserRepo {
  final UserService _nasaService;

  UserRepoImpl(this._nasaService);

  @override
  Future<List<User>> getUsersList() async {
    final res = await _nasaService.getUserList();
    if (res != null && res.isNotEmpty)
      return res.map((e) => e.toModel()).toList();
  }

  @override
  Future<bool> createUser(
      String name, String email, String gender, String status) async {
    final res = await _nasaService.createUser(name, email, gender, status);
    return res;
  }

  @override
  Future<bool> deleteUser(int id) async {
    final res = await _nasaService.deleteUser(id);
    return res;
  }

  @override
  Future<User> createUserwithObj(
      String name, String email, String gender, String status) async {
    final res =
        await _nasaService.createUserwithObj(name, email, gender, status);
    return res.toModel();
  }
}
