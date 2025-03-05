import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  final String username;
  final String role;

  const UsersEntity({
    required this.username,
    required this.role,
  });

  @override
  List<Object?> get props => [username, role];
}
