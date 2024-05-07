
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Column(
          children: [
            Text(
              'Bienvenue ${userController.currentUser.name}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Itim'
              ),
            ),
            const SizedBox(height: 16,),
            InkWell(
              onTap: () => context.read<AuthenticationBloc>().add(SignOutEvent()),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: secondary,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Text(
                  'Deconnexion',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim'
                  ),
                ),
              )
            )
          ]
        )
      ),
    );
  }
}
