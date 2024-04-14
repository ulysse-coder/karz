import 'package:flutter/material.dart';

class InterfaceComplexion extends StatefulWidget {
  const InterfaceComplexion({Key? key}) : super(key: key);

  @override
  State<InterfaceComplexion> createState() => _InterfaceState();
}

class _InterfaceState extends State<InterfaceComplexion> {
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
                'asset/images/Welcome.png',
                fit: BoxFit.cover,
                height: (longueurEcran / 2.46), //250
              ),
              Text(
                'Bienvenue',
                style: TextStyle(
                  fontSize: (longueurEcran / 15.4), //40
                  color: Colors.white,
                  fontFamily: 'Italianno',
                ),
              ),

              SizedBox(height: (longueurEcran/41.06)), //15

              Text(
                'Dites-nous qui vous êtes',
                style: TextStyle(
                  fontSize: (longueurEcran/30.8), //20
                  color: Colors.white,
                  fontFamily: 'Itim',
                ),
              ),

              SizedBox(height: (longueurEcran/41.06)), //15

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('Bouton Conducteur appuyé');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size((longueurEcran/15.4), (largeurEcran/9)), //40 //40
                      backgroundColor: const Color(0xFFE5E5E5),
                    ),
                    child:  Text(
                      'Conducteur',
                      style: TextStyle(
                        fontSize: (longueurEcran/30.8), //20
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      debugPrint('Bouton Gardien appuyé');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size((longueurEcran/4.1), (largeurEcran/9)), //150 //40
                      backgroundColor: const Color(0xFFE5E5E5),
                    ),
                    child:  Text(
                      'Gardien',
                      style: TextStyle(
                        fontSize: (longueurEcran/30.8), //20
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