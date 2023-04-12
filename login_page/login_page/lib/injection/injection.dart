import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:login_page/data/http/ihttp_helper.dart';
import 'package:login_page/data/shared_preferences/ishared_preferences.dart';
import 'package:login_page/data/shared_preferences/shared_preferences.dart';
import 'package:login_page/repository/irepository.dart';
import 'package:login_page/repository/repository.dart';
import 'package:login_page/ui/bloc/auth_bloc.dart';
import 'package:login_page/ui/login_page/bloc/login_bloc.dart';

import '../app/constants.dart';
import '../data/http/http_helper.dart';

final sl = GetIt.instance;

Future initGetIt() async {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.plain,
    ),
  );

  /// Init Dio & Shared Preferences

  sl.registerLazySingleton(() => (dio));
  sl.registerLazySingleton<ISharedPreferences>(() => SharedPrefs());
  sl.registerLazySingleton<IHttpHelper>(() => HttpHelper(sl()));
  sl.registerLazySingleton<IRepository>(() => Repository(sl(), sl()));

  /// Repository & Data Layer

  /// Bloc

  sl.registerFactory(() => AuthBloc(sl()));
  sl.registerFactory(() => LoginBloc(sl(), sl()));
}
