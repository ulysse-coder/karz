import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/utilities/custom_widget.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/interface_complexion.dart';

class InterfaceLogin extends StatefulWidget {
  const InterfaceLogin({super.key});

  @override
  State<InterfaceLogin> createState() => __InterfaceState();
}

class __InterfaceState extends State<InterfaceLogin> {
  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          loadingDialog();
        }
        else if(state is UserSignedInState) {
          Get.find<UserController>().currentUser = state.user as UserModel;
          context.read<AuthenticationBloc>().add(SetUserLoggingStateEvent());
        }
        else if(state is UserLoggingStateModified) {
          Get.offAll(() => const InterfaceComplexion());
        }
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: longueurEcran / 61.6), //10
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color(0xff14213D),
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
