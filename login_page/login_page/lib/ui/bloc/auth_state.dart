import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthUninitialized extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthUnauthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}
