import 'package:flutter/material.dart';

class InterfaceAuthentification1 extends StatefulWidget {
  const InterfaceAuthentification1({Key? key}) : super(key: key);

  @override
  State<InterfaceAuthentification1> createState() => _InterfaceState();
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
          padding: EdgeInsets.symmetric(horizontal: (longueurEcran / 41)),
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
                'Connectez vous à My app',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  //fontFamily: 'Italianno',
                ),
              ),

              SizedBox(height: 10),

              //boutton 1
              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Google appuyé");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asset/images/Welcome.png', // Chemin de l'image
                      //fit: BoxFit.cover, // Ajuster l'image pour couvrir la zone
                      height: 20,
                      width:  20,
                    ),
                    const Text(
                      'Connexion avec Google',
                      style: TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: (Size(50, 50)),
                ),
              ),

              SizedBox(height: 15),
              //boutton2
              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Facebook appuyé");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asset/images/Welcome.png', // Chemin de l'image
                      //fit: BoxFit.cover, // Ajuster l'image pour couvrir la zone
                      height: 20,
                      width:  20,
                    ),
                    const Text(
                      'Connexion avec Facebook',
                      style: TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: (Size(50, 50)),
                ),
              ),
              SizedBox(height: 15),
              //boutton3
              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Email appuyé");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asset/images/Welcome.png', // Chemin de l'image
                      //fit: BoxFit.cover, // Ajuster l'image pour couvrir la zone
                      height: 20,
                      width:  20,
                    ),
                    const Text(
                      'Connexion avec Email',
                      style: TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: (Size(50, 50)),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
