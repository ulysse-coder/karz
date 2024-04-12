
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/constants/dimensions.dart';
class Interface extends StatefulWidget {

  const Interface({super.key});

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
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
          decoration: const BoxDecoration(
            color: Color(0xff14213D)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/Welcome.png', // Chemin de l'image
                fit: BoxFit.cover, // Ajuster l'image pour couvrir la zone
                height: longueurEcran / 2.0867,
              ),
              Text(
                'Bienvenue',
                style: TextStyle(
                  fontSize: longueurEcran / 16.52,
                  color: Colors.white,
                  fontFamily: 'Italianno',
                ),
              ),
              const SizedBox(height: 20), // Espacement entre les deux conteneurs de texte
              const Text(
                'Dites-nous qui vous êtes',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Itim', // Police Itim
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('appui sur Conducteur');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 50),
                      backgroundColor: const Color(0xFFE5E5E5),
                    ),
                    child: const Text(
                      'Conducteur',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontFamily: 'Itim',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal:
                        10), // Marge horizontale et verticale de 10
                    child: ElevatedButton(
                      onPressed: () {
                        print('appui sur Gardien');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50), // Taille minimale du bouton
                        backgroundColor: const Color(0xFFE5E5E5), // Couleur de fond du bouton
                      ),
                      child: const Text(
                        'Gardien',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontFamily: 'Itim',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
