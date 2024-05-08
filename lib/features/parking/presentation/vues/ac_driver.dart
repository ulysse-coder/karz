import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'sidebar.dart';

void main() {
  runApp(const ac_driver());
}

class ac_driver extends StatelessWidget {
  const ac_driver({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();
    debugPrint("Largeur: $largeurEcran");
    debugPrint("Longueur: $longueurEcran");
    Widget sidebar = Scaffold(
      drawer: Sidebar(),
    );
    Widget toolbar = Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image(
            image: AssetImage('asset/images/menu2.png'),
            width: 60, // Largeur souhaitée de l'image
            height: 60, // Hauteur souhaitée de l'image
            color: Colors.orange, // Couleur de l'image (applique un filtre de couleur)
          ),
          //Image.asset('asset/images/menu2.png'),
          // Text("Menu", style: TextStyle(
          //     fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),),
          Text(
            "Karz",
            style: TextStyle(fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Itim',
                color: Colors.orange),
          ),
        ],
      ),
    );

    Widget validatebutton = Container(
      //margin: EdgeInsets.symmetric(vertical: (longueurEcran / 10.6), horizontal: (largeurEcran / 36)),
      padding: const EdgeInsets.only(bottom: 20),
      child: TextButton(
        onPressed: () {
          debugPrint("Boutton Trouver une place appuyé");
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
            minimumSize: MaterialStateProperty.all<Size>(Size(longueurEcran / 6,
                largeurEcran / 12.33)) // Couleur de fond orange
        ),
        child: Text(
          'Trouver une place',
          style: TextStyle(
            fontSize: (longueurEcran / 40.8),
            fontFamily: 'Itim',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
    return MaterialApp(
        //title: 'karz',
        debugShowCheckedModeBanner: false,
       // theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
         // useMaterial3: true,
        //),
        home: Scaffold(
          drawer: Sidebar(),
          appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
            //title: toolbar,
            //backgroundColor: Colors.transparent,
            actions: [
             Container(
                  //color: Colors.transparent,
                  padding: const EdgeInsets.only(right: 10),//const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Karz",
                        style: TextStyle(fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Itim',
                            color: Colors.orange),
                      ),
                    ],
                  ),)
            ],
          ),
            body:
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/images/localisation1.jpg'), // Chemin de votre image
                  fit: BoxFit.cover, // Ajuste l'image pour couvrir le container
                ),
              ),
              //color: Color(0xFF14213D), // Couleur d'arrière-plan bleu roi
              child:
              Column(
                children: [
                  /*Container(
                    height: 120,
                    child: toolbar,
                  ),*/
                  Expanded(child:
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:Container(
                      height: 400,
                      decoration: BoxDecoration(
                          color: Color(0xFF14213D),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child:

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20), // Marge supérieure souhaitée
                            child:
                            _buildcolumntext("Où Allez vous?",longueurEcran, largeurEcran),),
                          Expanded(
                            child:
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: validatebutton, // Bouton en bas de la page
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),)
                ],
              ),
            )
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
  Column _buildcolumntext(String label, int sizelong, int sizelarge){
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: (sizelarge/ 1.3), // Largeur souhaitée
            child:
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: label, // Libellé de la zone de texte
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      borderSide: BorderSide(color: Colors.white), // Couleur de la bordure
                    ),
                    labelStyle: TextStyle(fontSize: (sizelong / 45.5), //16
                        fontWeight: FontWeight.bold,color: Color(0xFFB3B3B3)),
                    hintStyle: TextStyle(fontSize: (sizelong / 45.5), //16
                        fontWeight: FontWeight.bold),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange), // Couleur de la bordure en focus
                    ),
                  ),)
              ],
            )
        ),
      ],
    );

  }}
