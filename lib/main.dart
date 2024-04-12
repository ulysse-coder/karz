import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/InterfaceAuthenification1.dart';
import 'package:ulysse_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: InterfaceAuthentification1()
    );
  }
}
