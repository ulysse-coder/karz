import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // Importez pour utiliser debugPrint
// Importez la bibliothèque `get` si vous en avez besoin
// Importez également la bibliothèque contenant les dimensions si nécessaire

class InterfaceAuthentification1 extends StatefulWidget {
  @override
  _InterfaceState createState() => _InterfaceState();
}

class _InterfaceState extends State<InterfaceAuthentification1> {
  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();
    debugPrint("Largeur: $largeurEcran");
    debugPrint("Longueur: $longueurEcran");

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 2),
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: Color(0xff14213D),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/Secure-login.png', // Chemin de l'image
                fit: BoxFit.cover, // Ajuster l'image pour couvrir la zone
                height: 250,
              ),
              Text(
                'Connectez vous à My app',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  //fontFamily: 'Italianno',
                ),
              ),

              SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  debugPrint("Boutton appuyé");
                },
                child: const Text(
                  'Click Me',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
