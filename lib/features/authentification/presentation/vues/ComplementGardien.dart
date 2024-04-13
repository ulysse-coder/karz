import 'package:flutter/material.dart';

class ComplementGardien extends StatefulWidget {
  @override
  _InterfaceState createState() => _InterfaceState();
}

class _InterfaceState extends State<ComplementGardien> {

    @override
    Widget build(BuildContext context) {
      int largeurEcran = MediaQuery.of(context).size.width.floor();
      int longueurEcran = MediaQuery.of(context).size.height.floor();

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE5E5E5), // Fond gris pour l'AppBar
          title: Text(
            'Compléter mes informations',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
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
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                // Ajouter une marge de 2cm entre l'image et les textfields
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Entrez votre nom complet',
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black, // Couleur grise pour la bordure
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 15),

              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Entrez votre numéro de téléphone',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    // Ajouter un remplissage pour centrer le texte
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // Arrondir les coins du TextField
                      borderSide: BorderSide(
                        color: Colors.black, // Couleur grise pour la bordure
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // Arrondir les coins du TextField
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 15),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                // Ajouter une marge de 2cm entre le bouton et les textfields
                child: TextButton( // Utilisation de TextButton avec un style personnalisé pour le fond orange
                  onPressed: () {
                    debugPrint("Boutton Continuer appuyé ");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFFF7A00)),
                    // Couleur orange pour le fond du bouton
                    minimumSize: MaterialStateProperty.all<Size>(Size(longueurEcran/6, largeurEcran/12.33)),
                  ),
                  child: Text(
                    'Continuer',
                    style: TextStyle(
                      fontSize: 23,
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

