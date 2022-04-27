import 'package:clean_architecture_ess/domain/enteties/user.dart';
import 'package:meta/meta.dart';

abstract class UserRepo {
  Future<List<User>> getUsersList();

  Future<bool> createUser(
      String name, String email, String gender, String status);
}
