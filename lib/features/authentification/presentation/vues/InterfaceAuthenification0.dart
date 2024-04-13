import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/constants/dimensions.dart';

class InterfaceAuthentification0 extends StatefulWidget {
  const InterfaceAuthentification0({Key? key}) : super(key: key);

  @override
  State<InterfaceAuthentification0> createState() => _InterfaceState();
}

class _InterfaceState extends State<InterfaceAuthentification0> {
  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();
    debugPrint("Largeur: $largeurEcran");
    debugPrint("Longueur: $longueurEcran");

    return Scaffold(
        backgroundColor: Color(0xff14213D),
        body: Center(
          child: Image.asset(
            'asset/images/logo.jpg',
            fit: BoxFit.cover, // Ajuster l'image pour couvrir la zone
            height: longueurEcran/1.78,
            width: largeurEcran/0.82,
          ),
        )
    );
  }
}
