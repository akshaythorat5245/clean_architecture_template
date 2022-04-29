import 'package:clean_architecture_ess/domain/enteties/user.dart';

abstract class UserRepo {
  Future<List<User>> getUsersList();

  Future<bool> createUser(
      String name, String email, String gender, String status);

  Future<bool> deleteUser(int id);

  Future<User> createUserwithObj(
      String name, String email, String gender, String status);
}
