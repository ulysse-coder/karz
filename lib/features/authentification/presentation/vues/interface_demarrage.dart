
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/home_page.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/interface_information.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/interface_login.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/on_boarding.dart';

class InterfaceDemarrage extends StatefulWidget {
  const InterfaceDemarrage({Key? key}) : super(key: key);

  @override
  State<InterfaceDemarrage> createState() => _InterfaceDemarrageState();
}

class _InterfaceDemarrageState extends State<InterfaceDemarrage> {
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(GetUserLoggingStateEvent());
  }

  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();
    debugPrint("Largeur: $largeurEcran");
    debugPrint("Longueur: $longueurEcran");

    return Scaffold(
        backgroundColor: primary,
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (_, state) {
            if(state is UserLoggingStateLoaded) {
              if(state.isLoggedIn) {
                switch (userController.currentUserRole) {
                  case UserRole.conducteur:
                    context.read<AuthenticationBloc>().add(CheckIfUserExistsEvent(
                      uid: userController.currentConductor.uid,
                      role: UserRole.conducteur
                    ));
                    break;
                  case UserRole.gardien:
                    context.read<AuthenticationBloc>().add(CheckIfUserExistsEvent(
                      uid: userController.currentSecurity.uid,
                      role: UserRole.gardien
                    ));
                    break;
                  case UserRole.defaultRole: break;
                }
              }
              else if(userController.currentUserRole == UserRole.defaultRole) {
                Get.offAll(() => const OnBoardingView());
              }
              else {
                Get.offAll(() => const InterfaceLogin());
              }
            }
            else if(state is UserExistenceCheckedState) {
              if(state.exists) {
                switch (userController.currentUserRole) {
                  case UserRole.conducteur:
                    Get.offAll(() => const HomePage());
                    break;
                  case UserRole.gardien:
                    // Get.offAll(() => const HomePage());
                    break;
                  case UserRole.defaultRole: break;
                }
                return;
              }

              Get.offAll(() => const InterfaceInformation());
            }
          },
          child: Center(
            child: Image.asset(
              'asset/icons/fav.ico',
              fit: BoxFit.cover, // Ajuster l'image pour couvrir la zone
              height: (longueurEcran/1.78),
              width: (largeurEcran/0.82),
            ),
          )
        )
    );
  }
}
