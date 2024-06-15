import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/home_page.dart';

import '../../../../core/utilities/enum.dart';

class InterfacePaiement extends StatefulWidget {
  const InterfacePaiement({Key? key}) : super(key: key);

  @override
  _InterfacePaiementState createState() => _InterfacePaiementState();
}

class _InterfacePaiementState extends State<InterfacePaiement> {
  UserController userController = Get.find();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF14213D),
        title: Text(
          'Paiement',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: longueurEcran / 27.5, // 24
            fontWeight: FontWeight.bold,
            //fontFamily: 'Italianno',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: longueurEcran / 66),
            Text(
              'Montant à payer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: longueurEcran / 43.75, // 22
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: longueurEcran / 66), // 10
            Container(
              padding: EdgeInsets.symmetric(horizontal: largeurEcran / 50, vertical: longueurEcran / 330), // 16, 5
              decoration: const BoxDecoration(
                color: Color(0xFF14213D),
              ),
              child: Text(
                'x dh',
                style: TextStyle(
                  fontSize: longueurEcran / 33, // 20
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: longueurEcran / 66), // 10

            Text(
              'Nom et prénom du détenteur de la carte',
              style: TextStyle(
                fontSize: (longueurEcran/61.6), //10
                color: Colors.grey,
              ),
            ),

            SizedBox(height: longueurEcran / 660), // 1

            Container(
              margin: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 12.47), // 5, 30
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 37.5), // 15, 15
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),

            SizedBox(height: longueurEcran / 66), // 10

            Text(
              'Nom et prénom du détenteur de la carte',
            style: TextStyle(
              fontSize: (longueurEcran/61.6), //10
              color: Colors.grey,
            ),
                        ),

            SizedBox(height: longueurEcran / 660), // 1

            Container(
              margin: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 12.47), // 5, 30
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 37.5), // 15, 15
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'N° de carte',
                    style: TextStyle(
                      fontSize: (longueurEcran/61.6), //10
                      color: Colors.grey,
                    ),
                  ),

                    SizedBox(height: longueurEcran / 660), // 1

                    Container(
                      margin: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 12.47), // 5, 30
                      child: TextField(
                        controller: _name,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 37.5), // 15, 15
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: longueurEcran / 660),
                      Text(
                         'CVC',
                         style: TextStyle(
                           fontSize: (longueurEcran/61.6), //10
                           color: Colors.grey,
                         ),
                       ),
        Container(
                          margin: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 12.47), // 5, 30
                          child: TextField(
                            controller: _name,
                            decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 37.5), // 15, 15
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),

              )
            ),
              ],
            ),
              SizedBox(height: longueurEcran / 660),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                      'Date d''expiration',
                      style: TextStyle(
                        fontSize: (longueurEcran/61.6), //10
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: longueurEcran / 660), // 1

                    Container(
                      margin: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 12.47), // 5, 30
                      child: TextField(
                        controller: _name,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 37.5), // 15, 15
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: longueurEcran / 660),
                    Container(

                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 12.47), // 5, 30
                        child: TextField(
                          controller: _name,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 37.5), // 15, 15
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(longueurEcran / 66.0), // 10
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),

                    )
                ),
              ],
            ),
              SizedBox(height: longueurEcran / 660),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text('Enregistrer ma carte'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Action à effectuer lorsque le bouton est pressé
                },
                child:
              ),
              ],

                SizedBox(height: longueurEcran / 660),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text('Je déclare sur honneur que les informations saisies sont correctes, et conformes à notre politique de confidentialité des données'),
              ],
            ),
            ElevatedButton(
              onPressed: () {

              },
              child:
            ),
          ],

            ),
            ),
      ),
    );
  }
}
