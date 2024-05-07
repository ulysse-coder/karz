import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/core/utilities/custom_widget.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/home_page.dart';

class InterfaceInformation extends StatefulWidget {
  const InterfaceInformation({super.key});

  @override
  State<InterfaceInformation> createState() => _InterfaceInformationState();
}

class _InterfaceInformationState extends State<InterfaceInformation> {
  UserController userController = Get.find();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name.text = userController.currentUser.name;
    _phone.text = userController.currentUser.phone;
  }

  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        debugPrint("========= Current state: $state");
        if (state is AuthLoadingState) {
          loadingDialog();
        } else if (state is UserCreatedState) {
          Get.off(() => const HomePage());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFE5E5E5),
          title: Text(
            'Compléter mes informations',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: (longueurEcran / 25.67), // 24
              fontWeight: FontWeight.bold,
              fontFamily: 'Itim',
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: (longueurEcran / 41.07)), //15
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: (longueurEcran / 123.2),
                    horizontal: (largeurEcran / 45)), //5 //8
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: 'Entrez votre nom complet',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: (longueurEcran / 61.6),
                        horizontal: (largeurEcran / 36)), //10 //10
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: (largeurEcran / 72), //5
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: (largeurEcran / 72), //5
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    _name.text = value;
                  },
                ),
              ),
              SizedBox(height: (longueurEcran / 123.2)), //5

              Container(
                margin: EdgeInsets.symmetric(
                    vertical: (longueurEcran / 123.2),
                    horizontal: (largeurEcran / 45)), //5 //8
                child: TextField(
                  controller: _phone,
                  decoration: InputDecoration(
                    hintText: 'Entrez votre numéro de téléphone',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: (longueurEcran / 61.6),
                        horizontal: (largeurEcran / 36)), //10 //10
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: (largeurEcran / 72), //5
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: (largeurEcran / 72), //5
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    _phone.text = value;
                  },
                ),
              ),
              SizedBox(height: (longueurEcran / 41.06)), //15

              Container(
                margin: EdgeInsets.symmetric(
                    vertical: (longueurEcran / 61.6),
                    horizontal: (largeurEcran / 36)), //10 //10
                child: TextButton(
                  onPressed: () {
                    debugPrint("Boutton Continuer appuyé ");
                    userController.currentUser = userController.currentUser
                        .copyWith(name: _name.text, phone: _phone.text);
                    debugPrint(
                        "======== Nouvelles informations: ${userController.currentUser}");
                    switch (userController.currentUser.role) {
                      case UserRole.conducteur:
                        context.read<AuthenticationBloc>().add(CreateUserEvent(
                              id: userController.currentUser.uid,
                              name: userController.currentUser.name,
                              phone: userController.currentUser.phone,
                              role: userController.currentUser.role,
                            ));
                        break;
                      case UserRole.gardien:
                        //Get.to(() => const HomePage());
                        break;
                      case UserRole.defaultRole:
                        break;
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        secondary),
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(longueurEcran / 6, largeurEcran / 12.33)),
                  ),
                  child: Text(
                    'Valider',
                    style: TextStyle(
                      fontSize: (longueurEcran / 30.8), // 20
                      fontFamily: 'Itim',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
