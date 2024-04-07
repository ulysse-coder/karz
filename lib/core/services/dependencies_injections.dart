import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulysse_app/features/authentification/data/data_sources/local/authentication_local_data_source.dart';
import 'package:ulysse_app/features/authentification/data/data_sources/local/authentication_local_data_source_implementation.dart';
import 'package:ulysse_app/features/authentification/data/data_sources/remote/authentication_remote_data_source.dart';
import 'package:ulysse_app/features/authentification/data/data_sources/remote/authentication_remote_data_source_implementation.dart';
import 'package:ulysse_app/features/authentification/data/repositories/authentication_repositries_implementation.dart';
import 'package:ulysse_app/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/check_if_user_exist.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/create_user.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/get_current_user.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/get_current_user_from_cache.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/save_current_user_to_cache.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_email_and_password.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_facebook.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sigin_with_google.dart';
import 'package:ulysse_app/features/authentification/domain/usecases/sign_out.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:ulysse_app/features/parking/data/data_sources/remote/parking_remote_data_source.dart';
import 'package:ulysse_app/features/parking/data/data_sources/remote/parking_remote_data_source_implementation.dart';
import 'package:ulysse_app/features/parking/data/repositories/parking_repository_implementation.dart';
import 'package:ulysse_app/features/parking/domain/repositories/parking_repository.dart';
import 'package:ulysse_app/features/parking/domain/usecases/add_parking.dart';
import 'package:ulysse_app/features/parking/domain/usecases/get_parking.dart';
import 'package:ulysse_app/features/parking/domain/usecases/get_parking_images.dart';
import 'package:ulysse_app/features/parking/domain/usecases/upload_parking_image.dart';
import 'package:ulysse_app/features/parking/presentation/app/bloc/parking_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();

  sl
    // app logic
    ..registerFactory(() => AuthenticationBloc(
        createUser: sl(),
        getCurrentUser: sl(),
        checkIfUserExists: sl(),
        signinWithEmailAndPassword: sl(),
        signinWithFacebook: sl(),
        signinWithGoogle: sl(),
        signOut: sl(),
        saveCurrentUserToCache: sl(),
        getCurrentUserFromCache: sl()))
    ..registerFactory(() => ParkingBloc(
        addParking: sl(),
        uploadParkingImage: sl(),
        getParking: sl(),
        getParkingImages: sl()))

    // auth use cases
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => GetCurrentUser(sl()))
    ..registerLazySingleton(() => CheckIfUserExist(sl()))
    ..registerLazySingleton(() => SiginWithEmailAndPassword(sl()))
    ..registerLazySingleton(() => SigninWithFacebook(sl()))
    ..registerLazySingleton(() => SiginWithGoogle(sl()))
    ..registerLazySingleton(() => SignOut(sl()))
    ..registerLazySingleton(() => SaveCurrenUserToCache(sl()))
    ..registerLazySingleton(() => GetCurrentUserFromCache(sl()))

    // parking use cases
    ..registerLazySingleton(() => AddParking(sl()))
    ..registerLazySingleton(() => UploadParkingImage(sl()))
    ..registerLazySingleton(() => GetParking(sl()))
    ..registerLazySingleton(() => GetParkingImages(sl()))

    // auth repositories
    ..registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImplementation(sl(), sl()))
    ..registerLazySingleton<AuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSourceImplementation(sl(), sl(), sl(), sl()))
    ..registerLazySingleton<AuthenticationLocalDataSource>(() => AuthenticationLocalDataSourceImplementation(sl()))

    // parking repositories
    ..registerLazySingleton<ParkingRepository>(() => ParkingRepositoryImplemetation(sl()))
    ..registerLazySingleton<ParkingRemoteDataSource>(() => ParkingRemoteDataSourceImplementation(sl(), sl()))

    // external dependencies
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance)
    ..registerLazySingleton(() => FacebookAuth.instance)
    ..registerLazySingleton(() => GoogleSignIn())
    ..registerLazySingleton(() => sharedPreferences);
}
