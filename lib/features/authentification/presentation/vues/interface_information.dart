import 'package:flutter/material.dart';

class InterfaceInformation extends StatefulWidget {
  const InterfaceInformation({super.key});

  @override
  State<InterfaceInformation> createState() => _InterfaceInformation();
}

class _InterfaceInformation extends State<InterfaceInformation> {

    @override
    Widget build(BuildContext context) {
      int largeurEcran = MediaQuery.of(context).size.width.floor();
      int longueurEcran = MediaQuery.of(context).size.height.floor();
      debugPrint("Largeur: $largeurEcran");
      debugPrint("Longueur: $longueurEcran");

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE5E5E5),
          title: Text(
            'Compléter mes informations',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: (longueurEcran/25.67), // 24
              fontWeight: FontWeight.bold,
              fontFamily: 'Itim',
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: (longueurEcran/41.07)), //15
              Container(
                margin: EdgeInsets.symmetric(vertical: (longueurEcran/123.2), horizontal: (largeurEcran/45)), //5 //8
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Entrez votre nom complet',
                    contentPadding: EdgeInsets.symmetric(vertical: (longueurEcran/61.6), horizontal: (largeurEcran/36)), //10 //10
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: (largeurEcran/72), //5
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: (largeurEcran/72), //5
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: (longueurEcran/123.2)), //5

              Container(
                margin: EdgeInsets.symmetric(vertical: (longueurEcran/123.2), horizontal: (largeurEcran/45)), //5 //8
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Entrez votre numéro de téléphone',
                    contentPadding: EdgeInsets.symmetric(vertical: (longueurEcran/61.6), horizontal: (largeurEcran/36)), //10 //10
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: (largeurEcran/72), //5
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: (largeurEcran/72), //5
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: (longueurEcran/41.06)), //15

              Container(
                margin: EdgeInsets.symmetric(vertical: (longueurEcran/61.6), horizontal: (largeurEcran/36)), //10 //10
                child: TextButton(
                  onPressed: () {
                    debugPrint("Boutton Continuer appuyé ");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFFF7A00)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(longueurEcran/6, largeurEcran/12.33)),
                  ),
                  child: Text(
                    'Valider',
                    style: TextStyle(
                      fontSize: (longueurEcran/30.8), // 20
                      fontFamily: 'Itim',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

