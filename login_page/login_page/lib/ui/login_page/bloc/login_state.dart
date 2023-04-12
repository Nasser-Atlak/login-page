import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginFailure extends LoginState {
  String error;

  LoginFailure({required this.error});
  @override
  List<Object?> get props => [error];
}

class LoginSuccessful extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();

}