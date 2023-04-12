import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page/repository/irepository.dart';
import 'package:login_page/ui/bloc/auth_bloc.dart';

import '../../bloc/auth_event.dart';
import './login_event.dart';
import './login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authBloc;
  final IRepository _iRepository;

  LoginBloc(this.authBloc, this._iRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>(onLoginButtonPressed);
  }

  void onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final token = await _iRepository.login(
      event.username!,
      event.password!,
    );

    if (token != null) {
      await _iRepository.persistToken(token);
      emit(LoginSuccessful());
    } else {
      throw Exception('Token is null');
    }
  }
}
