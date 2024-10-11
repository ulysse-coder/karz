
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:karz/core/services/dependencies_injections.dart';
import 'package:karz/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:karz/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:karz/features/authentification/presentation/vues/interface_demarrage.dart';
import 'package:karz/features/parking/presentation/app/bloc/parking_bloc.dart';
import 'package:karz/features/parking/presentation/app/controllers/parking_controller.dart';
import 'package:karz/features/reservation/presentation/app/bloc/bloc/reservation_bloc.dart';
import 'package:karz/features/reservation/presentation/app/bloc/controllers/reservation_controller.dart';
import 'package:karz/firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform
  ).then ((_) {
    Get.put(ParkingController());
    Get.put(UserController());
    Get.put(ReservationController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<AuthenticationBloc>()),
          BlocProvider(create: (_) => sl<ParkingBloc>()),
          BlocProvider(create: (_) => sl<ReservationBloc>()),
        ],
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const InterfaceDemarrage()
        )
    );
  }
}