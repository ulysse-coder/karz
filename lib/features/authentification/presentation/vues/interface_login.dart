import 'package:flutter/material.dart';

class InterfaceLogin extends StatefulWidget {
  const InterfaceLogin({super.key});

  @override
  State<InterfaceLogin> createState() => __InterfaceState();
}

class __InterfaceState extends State<InterfaceLogin> {
  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();
    debugPrint("Largeur: $largeurEcran");
    debugPrint("Longueur: $longueurEcran");

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: longueurEcran/61.6), //10
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color(0xff14213D),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/Welcome.png',
                fit: BoxFit.cover,
                height: (longueurEcran/3.08), //200
              ),

              SizedBox(height: longueurEcran/61.6), //10

              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Google appuyé");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize:  Size(longueurEcran/2.05, largeurEcran/18), //200 //20
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'asset/icons/google.jpeg',
                      height: (longueurEcran/20.53), //30
                    ),

                    SizedBox(width: (largeurEcran/7.2)), //50

                    Text(
                      'Connexion avec Google',
                      style: TextStyle(
                        fontSize: (longueurEcran/38.5), //16
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: (longueurEcran/41.06)), //15

              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Facebook appuyé");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize:  Size(longueurEcran/2.05, largeurEcran/18), //200 //20
                ),
                child:  Row(
                  children: [
                    Image.asset(
                      'asset/icons/facebook.png',
                      height: (longueurEcran/20.53), //30
                    ),

                    SizedBox(width: (largeurEcran/7.2)), //50

                    Text(
                      'Connexion avec Facebook',
                      style: TextStyle(
                        fontSize: (longueurEcran/38.5), //16
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: (longueurEcran/41.06)), //15

              TextButton(
                onPressed: () {
                  debugPrint("Bouton Connexion avec Email appuyé");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize:  Size(longueurEcran/2.05, largeurEcran/18), //200 //20
                ),
                child:  Row(
                  children: [
                    Image.asset(
                      'asset/icons/email.jpeg',
                      height: (longueurEcran/20.53), //30
                    ),

                    SizedBox(width: (largeurEcran/7.2)), //50

                    Text(
                      'Connexion avec Email',
                      style: TextStyle(
                        fontSize: (longueurEcran/38.5), //16
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
