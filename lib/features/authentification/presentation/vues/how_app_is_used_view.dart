

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/core/constants/dimensions.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/core/widgets/heading1.dart';
import 'package:ulysse_app/core/widgets/standard_text.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/app_use_case_listile.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/interface_login.dart';

class HowAppIsUsedView extends StatelessWidget {
  const HowAppIsUsedView({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingW20),
      decoration: const BoxDecoration(
        color: primary,
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [primary, fontColor],
        // )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ListTile(
            title: Heading1(
              text: "Prêt à démarrer ? ",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            subtitle: StandardText(
              text: "Comment souhaitez-vous utiliser Kaaly aujourd'hui ?",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),

          ),
          SizedBox(height: height100,),
          Column(
            children: [
              AppUseCaseListTile(
                title: "Je suis un gardien", 
                subtitle: "Cliquez ici pour enregistrer votre établissement et rejoindre notre réseau de restaurants partenaires.", 
                leadingIcon: Icons.man_2_outlined, 
                callback: () {
                  userController.currentUserRole = UserRole.conducteur;
                  userController.saveCurrentUserRole();
                  // Get.offAll(() => const InterfaceLogin());
                }
              ),
              SizedBox(height: height16,),
              AppUseCaseListTile(
                title: "Je suis un conducteur", 
                subtitle: "Cliquez ici pour commencer a reserver des places des maintenant.", 
                leadingIcon: Icons.drive_eta_rounded,
                callback: () {
                  userController.currentUserRole = UserRole.conducteur;
                  userController.saveCurrentUserRole();
                  Get.offAll(() => const InterfaceLogin());
                }
              )
            ],
          )
        ],
      ),
    );
  }
}