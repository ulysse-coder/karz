import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/interface_information.dart';

class InterfaceComplexion extends StatefulWidget {
  const InterfaceComplexion({Key? key}) : super(key: key);

  @override
  State<InterfaceComplexion> createState() => _InterfaceComplexionState();
}

class _InterfaceComplexionState extends State<InterfaceComplexion> {
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();
    debugPrint("Largeur: $largeurEcran");
    debugPrint("Longueur: $longueurEcran");

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding:  EdgeInsets.symmetric(horizontal: (longueurEcran/41)),
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
                height: (longueurEcran / 2.46), //250
              ),
              Text(
                'Bienvenue',
                style: TextStyle(
                  fontSize: (longueurEcran / 15.4), //40
                  color: Colors.white,
                  fontFamily: 'Italianno',
                ),
              ),

              SizedBox(height: (longueurEcran/41.06)), //15

              Text(
                'Dites-nous qui vous êtes',
                style: TextStyle(
                  fontSize: (longueurEcran/30.8), //20
                  color: Colors.white,
                  fontFamily: 'Itim',
                ),
              ),

              SizedBox(height: (longueurEcran/41.06)), //15

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      debugPrint('Bouton Conducteur appuyé');
                      userController.currentUser = userController.currentUser.copyWith(role: UserRole.conducteur);
                      debugPrint("========== Nouveau role: ${userController.currentUser.role}");
                      Get.to(() => const InterfaceInformation());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text(
                        'Conducteur',
                        style: TextStyle(
                          fontSize: (longueurEcran/30.8), //20
                          color: Colors.black87,
                        ),
                      ),
                    )
                  ),
                  InkWell(
                      onTap: () {
                        debugPrint('Bouton Gardien appuyé');
                        userController.currentUser = userController.currentUser.copyWith(role: UserRole.gardien);
                        debugPrint("========== Nouveau role: ${userController.currentUser.role}");
                        Get.to(() => const InterfaceInformation());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text(
                          'Gardien',
                          style: TextStyle(
                            fontSize: (longueurEcran/30.8), //20
                            color: Colors.black87,
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}