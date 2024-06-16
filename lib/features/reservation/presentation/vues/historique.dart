import 'package:flutter/material.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/home_page.dart';

class History extends StatefulWidget{
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History>{
  bool _isSelected = false;
  bool _isWidgetVisible = false;
  final int value = 3; // Valeur qui détermine combien d'icônes seront colorées

  @override
  Widget build(BuildContext context) {
    double containerHeight = _isWidgetVisible ? 208.0 : 100.0; //
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context); // Revenir à la page précédente
            //print("Icône de l'AppBar cliquée");
          },
        ),
        title: Text('Mes réservations'),
        backgroundColor: Colors.grey,
      ),
      body:
      Column(
        children: [
          //Liste des réservations
          Align(
            alignment: Alignment.topCenter,
            child:
            Container(
              height: containerHeight,
              width: 375,
              padding: EdgeInsets.only(top: 15),
              //decoration: BoxDecoration(border: Border.all(color: secondary)
              //),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isWidgetVisible = !_isWidgetVisible;
                          });
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 45,
                          color: Colors.black38,
                        ),
                      ),
                      Text(
                        '24/06',
                        style: TextStyle(
                          fontFamily: 'Itim',
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Ben Abdallah',
                        style: TextStyle(
                          fontFamily: 'Itim',
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '30dh',
                        style: TextStyle(
                          fontFamily: 'Itim',
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _isSelected ? Icons.check_circle_sharp : Icons
                              .radio_button_unchecked_rounded,
                          color: _isSelected ? primary : primary,
                          // Utilisez les couleurs appropriées
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                      ),
                    ],
                  ),
                  const Divider( // Ligne pleine
                    height: 0, // Hauteur de la ligne
                    thickness: 1, // Épaisseur de la ligne
                    color: Color(0xFFE9DEDE), // Couleur de la ligne
                  ),
                  //Détail de la réservation
                  Padding(padding: EdgeInsets.all(8),
                      child:
                          Material(
                            elevation: 15,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              /*decoration: BoxDecoration(
                            border: Border.all(color: primary),
                        ),*/
                              child:
                              Visibility(
                                visible: _isWidgetVisible,
                                child: Container(
                                  //color: secondary,
                                    height: 110,
                                    width: double.infinity,
                                    // Pour occuper toute la largeur disponible
                                    child: Center(
                                      child:
                                      Column(
                                        children: [
                                          Padding(padding: EdgeInsets.only(left: 8),
                                            child: Row(
                                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Time : ',
                                                      style: TextStyle(color: primary,
                                                          fontSize: 20,
                                                          fontFamily: 'Itim'),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '02h30mn ',
                                                      style: TextStyle(color: primary,
                                                          fontSize: 20,
                                                          fontFamily: 'Itim'),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),),
                                          Padding(padding: EdgeInsets.only(left: 8),
                                            child: Row(
                                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Note : ',
                                                      style: TextStyle(color: primary,
                                                          fontSize: 20,
                                                          fontFamily: 'Itim'),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Wrap(
                                                      spacing: 1.0,
                                                      // Espace horizontal entre les icônes
                                                      runSpacing: 10.0,
                                                      // Espace vertical entre les lignes d'icônes
                                                      children: List.generate(
                                                          5, (index) {
                                                        return Icon(Icons.star,
                                                          color: index < value
                                                              ? secondary
                                                              : Colors.grey,);
                                                      }),)
                                                  ],
                                                )
                                              ],
                                            ),),
                                          Padding(padding: EdgeInsets.only(
                                              top: 15, right: 15),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                              children: [
                                                InkWell(
                                                  onTap: () =>
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                HomePage()),
                                                      ),
                                                  child: Container(
                                                      width: 100,
                                                      height: 30,
                                                      /*padding: EdgeInsets.only(
                                                          left: 15),*/
                                                      decoration: BoxDecoration(
                                                          color: secondary,
                                                          borderRadius: BorderRadius
                                                              .circular(5)
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text('Réserver',
                                                            style: TextStyle(fontFamily: 'Itim', fontSize: 20),
                                                          ),
                                                        ],
                                                      )
                                                  ),
                                                )
                                              ],
                                            ),)

                                        ],
                                      ),


                                    )


                                ),
                              ),
                            ),
                          ),


                  )

                ],
              ),
            ),
          ),
          //Boutton Favoris et supprimer
          Spacer(), // This pushes the buttons to the bottom
          Container(

            height: 100,
            child:// Padding(
              //padding: const EdgeInsets.all(8.0),
              //child:
            Positioned(
                left: 0,
                right: 0,
                top: 50,
              child: Material(
                  elevation: 15, // Définir l'élévation pour l'effet d'ombre
                  borderRadius: BorderRadius.circular(12), // Même radius que le bouton
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        width: 150, // Définir la largeur des boutons
                        height: 60, // Définir la hauteur des boutons
                        child: OutlinedButton(
                          onPressed: () {
                            // Votre code onPressed ici
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 2.0, color: primary), // Définir la bordure
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Modifier le radius
                            ),
                          ),
                          child: Text('Favoris', style: TextStyle(fontSize: 20, fontFamily: 'Itim', color: primary),),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        width: 150, // Définir la largeur des boutons
                        height: 60, // Définir la hauteur des boutons
                        child: OutlinedButton(
                          onPressed: () {
                            // Votre code onPressed ici
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 2.0, color: primary), // Définir la bordure
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Modifier le radius
                            ),
                          ),
                          child: Text('Supprimer', style: TextStyle(fontSize: 20, fontFamily: 'Itim', color: primary),),
                        ),
                      )


                    ],
                  ),
              ),

            )

            //),
          )

        ],
      ),
    );}
  }
