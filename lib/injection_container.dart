import 'package:blog_app/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:blog_app/features/authentication/domain/usecases/Get_Name_usecase.dart';
import 'package:blog_app/features/authentication/domain/usecases/first_page_usecase.dart';
import 'package:blog_app/features/authentication/domain/usecases/google_auth_usecase.dart';
import 'package:blog_app/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:blog_app/features/authentication/domain/usecases/sign_in_usecase.dart';
import 'package:blog_app/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:blog_app/features/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - posts

  // Bloc
  sl.registerFactory(() => AuthBloc(
      signInUseCase: sl(),
      signUpUseCase: sl(),
      firstPage: sl(),
      logOutUseCase: sl(),
      getNameUseCase: sl(),
      googleAuthUseCase: sl()));

  // Usecases
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => FirstPageUseCase(sl()));
  sl.registerLazySingleton(() => GetNameUseCase(repository: sl()));
  sl.registerLazySingleton(() => LogOutUseCase(sl()));
  sl.registerLazySingleton(() => GoogleAuthUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImp(
          networkInfo: sl(), authRemoteDataSource: sl()));

  // Datasources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl<FirebaseFirestore>()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => InternetConnection());

  // Register FirebaseFirestore
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}
