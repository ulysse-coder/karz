import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:karz/features/authentification/data/data_sources/local/authentication_local_data_source.dart';
import 'package:karz/features/authentification/data/data_sources/local/authentication_local_data_source_implementation.dart';
import 'package:karz/features/authentification/data/data_sources/remote/authentication_remote_data_source.dart';
import 'package:karz/features/authentification/data/data_sources/remote/authentication_remote_data_source_implementation.dart';
import 'package:karz/features/authentification/data/repositories/authentication_repositries_implementation.dart';
import 'package:karz/features/authentification/domain/repositories/authentication_repository.dart';
import 'package:karz/features/authentification/domain/usecases/check_if_user_exist.dart';
import 'package:karz/features/authentification/domain/usecases/create_conductor.dart';
import 'package:karz/features/authentification/domain/usecases/create_security.dart';
import 'package:karz/features/authentification/domain/usecases/get_conductor.dart';
import 'package:karz/features/authentification/domain/usecases/get_current_user_from_cache.dart';
import 'package:karz/features/authentification/domain/usecases/get_security.dart';
import 'package:karz/features/authentification/domain/usecases/get_user_logging_state.dart';
import 'package:karz/features/authentification/domain/usecases/save_current_user_to_cache.dart';
import 'package:karz/features/authentification/domain/usecases/set_user_logging_state.dart';
import 'package:karz/features/authentification/domain/usecases/sigin_with_email_and_password.dart';
import 'package:karz/features/authentification/domain/usecases/sigin_with_facebook.dart';
import 'package:karz/features/authentification/domain/usecases/sigin_with_google.dart';
import 'package:karz/features/authentification/domain/usecases/sign_out.dart';
import 'package:karz/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:karz/features/parking/data/data_sources/remote/parking_remote_data_source.dart';
import 'package:karz/features/parking/data/data_sources/remote/parking_remote_data_source_implementation.dart';
import 'package:karz/features/parking/data/repositories/parking_repository_implementation.dart';
import 'package:karz/features/parking/domain/repositories/parking_repository.dart';
import 'package:karz/features/parking/domain/usecases/add_parking.dart';
import 'package:karz/features/parking/domain/usecases/add_place.dart';
import 'package:karz/features/parking/domain/usecases/delete_place.dart';
import 'package:karz/features/parking/domain/usecases/get_all_parkings.dart';
import 'package:karz/features/parking/domain/usecases/get_parking.dart';
import 'package:karz/features/parking/domain/usecases/get_parking_images.dart';
import 'package:karz/features/parking/domain/usecases/get_places_by_parking.dart';
import 'package:karz/features/parking/domain/usecases/select_image_from_gallery.dart';
import 'package:karz/features/parking/domain/usecases/update_place.dart';
import 'package:karz/features/parking/domain/usecases/upload_parking_image.dart';
import 'package:karz/features/parking/presentation/app/bloc/parking_bloc.dart';
import 'package:karz/features/reservation/data/data_sources/remote/reservation_remote_data_source.dart';
import 'package:karz/features/reservation/data/data_sources/remote/reservation_remote_data_source_implementation.dart';
import 'package:karz/features/reservation/data/repositories/reservation_repository_implementation.dart';
import 'package:karz/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:karz/features/reservation/domain/usecases/create_reservation.dart';
import 'package:karz/features/reservation/domain/usecases/delete_reservation.dart';
import 'package:karz/features/reservation/domain/usecases/get_reservation.dart';
import 'package:karz/features/reservation/domain/usecases/get_reservations_by_parking.dart';
import 'package:karz/features/reservation/domain/usecases/get_reservations_by_user.dart';
import 'package:karz/features/reservation/domain/usecases/update_reservation.dart';
import 'package:karz/features/reservation/presentation/app/bloc/bloc/reservation_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();

  sl
    // app logic
    ..registerFactory(() => AuthenticationBloc(
        createConductor: sl(),
        createSecurity: sl(),
        getConductor: sl(),
        getSecurity: sl(),
        getUserLoggingState: sl(),
        setUserLoggingState: sl(),
        checkIfUserExists: sl(),
        signinWithEmailAndPassword: sl(),
        signinWithFacebook: sl(),
        signinWithGoogle: sl(),
        signOut: sl(),
        saveCurrentUserToCache: sl(),
        getCurrentUserFromCache: sl()))
    ..registerFactory(() => ParkingBloc(
        addParking: sl(),
        selectImageFromGallery: sl(),
        uploadParkingImage: sl(),
        getParking: sl(),
        getParkingImages: sl(),
        getPlacesByParking: sl(),
        addPlace: sl(),
        updatePlace: sl(),
        deletePlace: sl(), 
        getAllParkings: sl()))
    ..registerFactory(() => ReservationBloc(
        getReservation: sl(),
        getReservationsByParking: sl(),
        getReservationsByUser: sl(),
        createReservation: sl(),
        updateReservation: sl(),
        cancelReservation: sl()))

    // auth use cases
    ..registerLazySingleton(() => CreateConductor(sl()))
    ..registerLazySingleton(() => CreateSecurity(sl()))
    ..registerLazySingleton(() => GetConductor(sl()))
    ..registerLazySingleton(() => GetSecurity(sl()))
    ..registerLazySingleton(() => GetUserLoggingState(sl()))
    ..registerLazySingleton(() => SetUserLoggingState(sl()))
    ..registerLazySingleton(() => CheckIfUserExist(sl()))
    ..registerLazySingleton(() => SiginWithEmailAndPassword(sl()))
    ..registerLazySingleton(() => SigninWithFacebook(sl()))
    ..registerLazySingleton(() => SiginWithGoogle(sl()))
    ..registerLazySingleton(() => SignOut(sl()))
    ..registerLazySingleton(() => SaveCurrenUserToCache(sl()))
    ..registerLazySingleton(() => GetCurrentUserFromCache(sl()))

    // parking use cases
    ..registerLazySingleton(() => AddParking(sl()))
    ..registerLazySingleton(() => SelectImageFromGallery(sl()))
    ..registerLazySingleton(() => UploadParkingImage(sl()))
    ..registerLazySingleton(() => GetParking(sl()))
    ..registerLazySingleton(() => GetAllParkings(sl()))
    ..registerLazySingleton(() => GetParkingImages(sl()))
    ..registerLazySingleton(() => GetPlacesByParking(sl()))
    ..registerLazySingleton(() => AddPlace(sl()))
    ..registerLazySingleton(() => UpdatePlace(sl()))
    ..registerLazySingleton(() => DeletePlace(sl()))

    // reservation use cases
    ..registerLazySingleton(() => GetReservation(sl()))
    ..registerLazySingleton(() => GetReservationsByParking(sl()))
    ..registerLazySingleton(() => GetReservationsByUser(sl()))
    ..registerLazySingleton(() => CreateReservation(sl()))
    ..registerLazySingleton(() => UpdateReservation(sl()))
    ..registerLazySingleton(() => CancelReservation(sl()))

    // auth repositories
    ..registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImplementation(sl(), sl()))
    ..registerLazySingleton<AuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSourceImplementation(sl(), sl(), sl(), sl()))
    ..registerLazySingleton<AuthenticationLocalDataSource>(() => AuthenticationLocalDataSourceImplementation(sl(), sl()))

    // parking repositories
    ..registerLazySingleton<ParkingRepository>(() => ParkingRepositoryImplemetation(sl()))
    ..registerLazySingleton<ParkingRemoteDataSource>(() => ParkingRemoteDataSourceImplementation(sl(), sl(), sl()))

    // reservation repositories
    ..registerLazySingleton<ReservationRepository>(() => ReservationRespositoryImplementation(sl()))
    ..registerLazySingleton<ReservationRemoteDataSource>(() => ReservationRemoteDataSourceImplementation(sl()))

    // external dependencies
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance)
    ..registerLazySingleton(() => FacebookAuth.instance)
    ..registerLazySingleton(() => GoogleSignIn())
    ..registerLazySingleton(() => sharedPreferences)
    ..registerLazySingleton(() => ImagePicker());
}
