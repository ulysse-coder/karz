import 'package:flutter/material.dart';

class InterfaceDemarrage extends StatefulWidget {
  const InterfaceDemarrage({Key? key}) : super(key: key);

  @override
  State<InterfaceDemarrage> createState() => _InterfaceDemarrage();
}

class _InterfaceDemarrage extends State<InterfaceDemarrage> {
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
            height: (longueurEcran/1.78),
            width: (largeurEcran/0.82),
          ),
        )
    );
  }
}
