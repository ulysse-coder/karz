import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:karz/core/constants/colors.dart';
import 'package:karz/core/utilities/custom_widget.dart';
import 'package:karz/core/utilities/enum.dart';
import 'package:karz/features/authentification/data/models/conductor_model.dart';
import 'package:karz/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:karz/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:karz/features/authentification/presentation/vues/home_page.dart';
import 'package:karz/features/authentification/presentation/vues/interface_information.dart';

class InterfaceLogin extends StatefulWidget {
  const InterfaceLogin({super.key});

  @override
  State<InterfaceLogin> createState() => _InterfaceLoginState();
}

class _InterfaceLoginState extends State<InterfaceLogin> {
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        debugPrint("======= state: $state");
        if (state is AuthLoadingState) {
          loadingDialog();
        }
        else if(state is ConductorSignedInState) {
          userController.currentConductor = state.conductor as ConductorModel;
          context.read<AuthenticationBloc>().add(SetUserLoggingStateEvent());
        }
        else if(state is UserLoggingStateModified) {
          context.read<AuthenticationBloc>().add(CheckIfUserExistsEvent(
            uid: userController.currentConductor.uid,
            role: UserRole.conducteur
          ));
        }
        else if(state is UserExistenceCheckedState) {
          if(state.exists) {
            context.read<AuthenticationBloc>().add(GetConductorEvent(id: userController.currentConductor.uid));
          }
          else {
            Get.offAll(() => const InterfaceInformation());
          }
        }
        else if(state is ConductorLoaded) {
          userController.currentConductor = state.conductor as ConductorModel;
          Get.offAll(() => const HomePage());
        }
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: longueurEcran / 61.6), //10
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            color: primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/Welcome.png',
                fit: BoxFit.cover,
                height: (longueurEcran / 3.08), //200
              ),

              SizedBox(height: longueurEcran / 61.6), //10

              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Google appuyé");
                  context
                      .read<AuthenticationBloc>()
                      .add(SiginWithGoogleEvent());
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize:
                      Size(longueurEcran / 2.05, largeurEcran / 18), //200 //20
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'asset/icons/google.jpeg',
                      height: (longueurEcran / 20.53), //30
                    ),

                    SizedBox(width: (largeurEcran / 12)), //50

                    Text(
                      'Connexion avec Google',
                      style: TextStyle(
                        fontSize: (longueurEcran / 38.5), //16
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: (longueurEcran / 41.06)), //15

              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Facebook appuyé");
                  context
                      .read<AuthenticationBloc>()
                      .add(SiginWithFacebookEvent());
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize:
                      Size(longueurEcran / 2.05, largeurEcran / 18), //200 //20
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'asset/icons/facebook.png',
                      height: (longueurEcran / 20.53), //30
                    ),

                    SizedBox(width: (largeurEcran / 12)), //50

                    Text(
                      'Connexion avec Facebook',
                      style: TextStyle(
                        fontSize: (longueurEcran / 38.5), //16
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: (longueurEcran / 41.06)), //15

              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Email appuyé");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize:
                      Size(longueurEcran / 2.05, largeurEcran / 18), //200 //20
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'asset/icons/email.jpeg',
                      height: (longueurEcran / 20.53), //30
                    ),

                    SizedBox(width: (largeurEcran / 12)), //50

                    Text(
                      'Connexion avec Email',
                      style: TextStyle(
                        fontSize: (longueurEcran / 38.5), //16
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
