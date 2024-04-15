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
          padding:  EdgeInsets.symmetric(horizontal: (longueurEcran/41)),
          height: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color(0xff14213D),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/Welcome.png', // Chemin de l'image
                fit: BoxFit.cover, // Ajuster l'image pour couvrir la zone
                height: (longueurEcran / 2.0867),
              ),
              Text(
                'Bienvenue',
                style: TextStyle(
                  fontSize: (longueurEcran / 16.52),
                  color: Colors.white,
                  fontFamily: 'Italianno',
                ),
              ),

              const SizedBox(height: 15),

              Text(
                'Dites-nous qui vous êtes',
                style: TextStyle(
                  fontSize: (longueurEcran/30),
                  color: Colors.white,
                  fontFamily: 'Itim',
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('Bouton Conducteur appuyé');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      backgroundColor: const Color(0xFFE5E5E5),
                    ),
                    child:  Text(
                      'Conducteur',
                      style: TextStyle(
                        fontSize: (longueurEcran/30),
                        color: Colors.black87,
                        //fontFamily: 'Itim',
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      debugPrint('Bouton Gardien appuyé');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      backgroundColor: const Color(0xFFE5E5E5),
                    ),
                    child:  Text(
                      'Gardien',
                      style: TextStyle(
                        fontSize: (longueurEcran/30),
                        color: Colors.black87,
                        //fontFamily: 'Itim',
                      ),
                    ),
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