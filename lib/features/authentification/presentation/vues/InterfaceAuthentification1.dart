code interface authentification Google/Fac...
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interface Authentif',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 15), // Remontée de l'image
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Bureau/interf.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15), // Espacement réduit entre le texte et les boutons
          Text(
            'Charger votre image en PNG, JPG...',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'calibri'),
          ),
          Expanded(
            child: Container(
              color: Color(0xFF31B51C),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 5), // Espacement réduit entre les boutons
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12), // Marge de 1 cm entre les boutons
                    child: TextButton(
                      onPressed: () {
                        print('Connexion avec Google');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.android,
                            color: Colors.red, // Couleur vive
                            size: 30, // Taille de l'icône
                          ), // Icône Google
                          SizedBox(width: 10),
                          Text(
                            'Connexion avec Google',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12), // Marge de 1 cm entre les boutons
                    child: TextButton(
                      onPressed: () {
                        // Événement lorsque le bouton de connexion avec Facebook est pressé
                        print('Connexion avec Facebook');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.facebook,
                            color: Colors.blueAccent, // Couleur vive
                            size: 30, // Taille de l'icône
                          ), // Icône Facebook
                          SizedBox(width: 10),
                          Text(
                            'Connexion avec Facebook',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12), // Marge de 1 cm entre les boutons
                    child: TextButton(
                      onPressed: () {
                        // Événement lorsque le bouton de connexion avec Email est pressé
                        print('Connexion avec Email');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.black, // Couleur vive
                            size: 30, // Taille de l'icône
                          ), // Icône Email
                          SizedBox(width: 10),
                          Text(
                            'Connexion avec Email',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




