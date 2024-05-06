import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/home_page.dart';

import '../../../../core/utilities/enum.dart';


class InterfaceReservation extends StatefulWidget {
  const InterfaceReservation({Key? key}) : super(key: key);

  @override
  _InterfaceReservationState createState() => _InterfaceReservationState();
}

class _InterfaceReservationState extends State<InterfaceReservation> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE5E5E5),
        title: Text(
          'Réserver ma place',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: (longueurEcran / 25.67), // 24
            fontWeight: FontWeight.bold,
            fontFamily: 'Italionno',
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
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Entrez votre N° de plaque',
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
                  setState(() {});
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
                  setState(() {});
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
                  userController.currentUser = userController.currentUser.copyWith(
                    name: _name.text,
                    phone: _phone.text,
                  );
                  debugPrint(
                      "======== Nouvelles informations: ${userController.currentUser}");
                  switch (userController.currentUser.role) {
                    case UserRole.conducteur:
                      context.read<AuthenticationBloc>().add(
                        CreateUserEvent(
                          id: userController.currentUser.uid,
                          name: userController.currentUser.name,
                          phone: userController.currentUser.phone,
                          role: userController.currentUser.role,
                        ),
                      );
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
                      const Color(0xFFFF7A00)),
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
    );
  }
}
