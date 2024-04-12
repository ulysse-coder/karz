import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/constants/dimensions.dart';

class InterfaceAuthentification2 extends StatefulWidget {
  const InterfaceAuthentification2({Key? key}) : super(key: key);

  @override
  State<InterfaceAuthentification2> createState() => _InterfaceState();
}

class _InterfaceState extends State<InterfaceAuthentification2> {
  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();
    debugPrint("Largeur: $largeurEcran");
    debugPrint("Longueur: $longueurEcran");

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color(0xff14213D),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Applogo',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
