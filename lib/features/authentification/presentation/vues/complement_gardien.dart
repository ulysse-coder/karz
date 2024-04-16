import 'package:flutter/material.dart';

class ComplementGardien extends StatefulWidget {
  const ComplementGardien({super.key});

  @override
  State<ComplementGardien>  createState() => _ComplementGardien();
}

class _ComplementGardien extends State<ComplementGardien> {

    @override
    Widget build(BuildContext context) {
      int largeurEcran = MediaQuery.of(context).size.width.floor();
      int longueurEcran = MediaQuery.of(context).size.height.floor();

      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFE5E5E5), // Fond gris pour l'AppBar
          title: const Text(
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
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                // Ajouter une marge de 2cm entre l'image et les textfields
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Entrez votre nom complet',
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black, // Couleur grise pour la bordure
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(height: 15),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Entrez votre numéro de téléphone',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    // Ajouter un remplissage pour centrer le texte
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // Arrondir les coins du TextField
                      borderSide: const BorderSide(
                        color: Colors.black, // Couleur grise pour la bordure
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // Arrondir les coins du TextField
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(height: 15),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                // Ajouter une marge de 2cm entre le bouton et les textfields
                child: TextButton( // Utilisation de TextButton avec un style personnalisé pour le fond orange
                  onPressed: () {
                    debugPrint("Boutton Continuer appuyé ");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFFF7A00)),
                    // Couleur orange pour le fond du bouton
                    minimumSize: MaterialStateProperty.all<Size>(Size(longueurEcran/6, largeurEcran/12.33)),
                  ),
                  child: const Text(
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

