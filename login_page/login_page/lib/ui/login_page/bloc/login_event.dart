import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonPressed extends LoginEvent {
  final String? username;
  final String? password;

  LoginButtonPressed({required this.username, required this.password});
  @override
  List<Object?> get props => [username, password];
}
