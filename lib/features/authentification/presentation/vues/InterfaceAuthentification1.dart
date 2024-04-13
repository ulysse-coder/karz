import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.maxFinite,
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
                height: (longueurEcran/3.08),
              ),
              SizedBox(height: longueurEcran/61.6),
              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Google appuyé");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize:  Size(longueurEcran/2.05, largeurEcran/20.53),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'asset/icons/google.jpeg', // Chemin de l'image
                      height: 30, // Taille de l'image
                    ),
                    const SizedBox(width: 45),
                    const Text(
                      'Connexion avec Google',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Facebook appuyé");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize:  Size(longueurEcran/2.05, largeurEcran/20.53),
                ),
                child:  Row(
                  children: [
                    Image.asset(
                      'asset/icons/facebook.png', // Chemin de l'image
                      height: 30, // Taille de l'image
                    ),
                    const SizedBox(width: 45),
                    const Text(
                      'Connexion avec Facebook',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Email appuyé");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize:  Size(longueurEcran/2.05, largeurEcran/20.53),
                ),
                child:  Row(
                  children: [
                    Image.asset(
                      'asset/icons/email.jpeg', // Chemin de l'image
                      height: 30, // Taille de l'image
                    ),
                    const SizedBox(width: 45),
                    const Text(
                      'Connexion avec Google',
                      style: TextStyle(
                        fontSize: 16,
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
