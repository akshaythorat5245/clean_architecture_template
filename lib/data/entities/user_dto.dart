import 'package:clean_architecture_ess/domain/enteties/user.dart';

class UserDTO {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String status;

  const UserDTO({this.id, this.name, this.email, this.gender, this.status});

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        gender: json['gender'] as String,
        status: json['status'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'gender': gender,
        'status': status,
      };

  User toModel() {
    return User(
        id: id, name: name, email: email, gender: gender, status: status);
  }
}
