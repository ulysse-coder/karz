
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/home_page.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/interface_complexion.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/interface_login.dart';

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
    // context.read<AuthenticationBloc>().add(SignOutEvent());
    // context.read<AuthenticationBloc>().add(SetUserLoggingStateEvent());
    context.read<AuthenticationBloc>().add(GetUserLoggingStateEvent());
  }

  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();
    debugPrint("Largeur: $largeurEcran");
    debugPrint("Longueur: $longueurEcran");

    return Scaffold(
        backgroundColor: const Color(0xff14213D),
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (_, state) {
            if(state is UserLoggingStateLoaded) {
              if(state.isLoggedIn) {
                context.read<AuthenticationBloc>().add(CheckIfUserExistsEvent(
                  uid: userController.currentUser.uid,
                  role: userController.currentUser.role
                ));
              }
              else {
                Get.offAll(() => const InterfaceLogin());
              }
            }
            else if(state is UserExistenceCheckedState) {
              state.exists ? Get.offAll(() => const HomePage()) : Get.offAll(() => const InterfaceComplexion());
            }
          },
          builder: (_, state) {
            if(State is AuthLoadingState) {
              return Center(
                child: Image.asset(
                  'asset/icons/fav.ico',
                  fit: BoxFit.cover, // Ajuster l'image pour couvrir la zone
                  height: (longueurEcran/1.78),
                  width: (largeurEcran/0.82),
                ),
              );
            }
            return const Center(child: Text("Une erreur s'est produite"),);
          },
        )
    );
  }
}
