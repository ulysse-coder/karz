import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/services/dependencies_injections.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/interaface_reservation.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/interface_demarrage.dart';
import 'package:ulysse_app/firebase_options.dart';

import 'features/authentification/presentation/app/controller/user_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform
  ).then ((_) => Get.put(UserController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<AuthenticationBloc>())
        ],
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const InterfaceReservation()
        )
    );
  }
}