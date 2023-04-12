import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/irepository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IRepository _iRepository;

  AuthBloc(this._iRepository) : super(AuthUninitialized()) {
    on<AppStarted>(onAppStarted);
    on<LoggedIn>(onLoggedIn);
    on<LoggedOut>(onLoggedOut);
  }

  void onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    var hasToken = await _iRepository.hasToken();
    if (hasToken != null) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void onLoggedIn(LoggedIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
 
    var hasToken = await _iRepository.hasToken();

    if (hasToken != null) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void onLoggedOut(LoggedOut event, Emitter<AuthState> emit) {
    _iRepository.deleteToken();

    emit(AuthUnauthenticated());
  }
}
