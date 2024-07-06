import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';

class InterfacePaiement extends StatefulWidget {
  const InterfacePaiement({Key? key}) : super(key: key);

  @override
  State<InterfacePaiement> createState() => _InterfacePaiementState();
}

class _InterfacePaiementState extends State<InterfacePaiement> {
  UserController userController = Get.find();
  final TextEditingController _name = TextEditingController();
  // final TextEditingController _phone = TextEditingController();
  // final TextEditingController _date = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              padding: EdgeInsets.symmetric(
                  horizontal: largeurEcran / 50,
                  vertical: longueurEcran / 330), // 16, 5
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
                fontSize: (longueurEcran / 61.6), //10
                color: Colors.grey,
              ),
            ),

            SizedBox(height: longueurEcran / 660), // 1

            TextField(
              controller: _name,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: longueurEcran / 66,
                    horizontal: largeurEcran / 37.5), // 15, 15
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(longueurEcran / 66.0), // 10
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(longueurEcran / 66.0), // 10
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

            /* Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(
                  vertical: longueurEcran / 330,
                  horizontal: largeurEcran / 12.47), // 5, 30
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: longueurEcran / 66,
                      horizontal: largeurEcran / 37.5), // 15, 15
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(longueurEcran / 66.0), // 10
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(longueurEcran / 66.0), // 10
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
            ), */

            SizedBox(height: longueurEcran / 66), // 10

            Text(
              'Nom et prénom du détenteur de la carte',
              style: TextStyle(
                fontSize: (longueurEcran / 61.6), //10
                color: Colors.grey,
              ),
            ),

            SizedBox(height: longueurEcran / 660), // 1

            TextField(
              controller: _name,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: longueurEcran / 66,
                    horizontal: largeurEcran / 37.5), // 15, 15
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(longueurEcran / 66.0), // 10
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(longueurEcran / 66.0), // 10
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

            /* Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(
                  vertical: longueurEcran / 330,
                  horizontal: largeurEcran / 12.47), // 5, 30
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: longueurEcran / 66,
                      horizontal: largeurEcran / 37.5), // 15, 15
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(longueurEcran / 66.0), // 10
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(longueurEcran / 66.0), // 10
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
            ), */

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   'N° de carte',
                //   style: TextStyle(
                //     fontSize: (longueurEcran / 61.6), //10
                //     color: Colors.grey,
                //   ),
                // ),

                // SizedBox(height: longueurEcran / 660), // 1

                Expanded(
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: longueurEcran / 66,
                          horizontal: largeurEcran / 37.5), // 15, 15
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
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

                Expanded(
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: longueurEcran / 66,
                          horizontal: largeurEcran / 37.5), // 15, 15
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
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
                )
                /* Container(
                  margin: EdgeInsets.symmetric(
                      vertical: longueurEcran / 330,
                      horizontal: largeurEcran / 12.47), // 5, 30
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: longueurEcran / 66,
                          horizontal: largeurEcran / 37.5), // 15, 15
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
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
                ), */
                /* Text(
                  'CVC',
                  style: TextStyle(
                    fontSize: (longueurEcran / 61.6), //10
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: longueurEcran / 330,
                      horizontal: largeurEcran / 12.47), // 5, 30
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: longueurEcran / 66,
                          horizontal: largeurEcran / 37.5), // 15, 15
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
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
                ), */
              ],
            ),
            SizedBox(height: longueurEcran / 660),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* Text(
                  'Date d' 'expiration',
                  style: TextStyle(
                    fontSize: (longueurEcran / 61.6), //10
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: longueurEcran / 660),  */// 1
                Expanded(
                  // margin: EdgeInsets.symmetric(
                  //     vertical: longueurEcran / 330,
                  //     horizontal: largeurEcran / 12.47), // 5, 30
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: longueurEcran / 66,
                          horizontal: largeurEcran / 37.5), // 15, 15
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
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
                Expanded(
                  // margin: EdgeInsets.symmetric(
                  //     vertical: longueurEcran / 330,
                  //     horizontal: largeurEcran / 12.47), // 5, 30
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: longueurEcran / 66,
                          horizontal: largeurEcran / 37.5), // 15, 15
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(longueurEcran / 66.0), // 10
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
                )
              ],
            ),
            SizedBox(height: longueurEcran / 660),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (bool? value) {
                    setState(() {
                      // isChecked = value!;
                    });
                  },
                ),
                const Text('Enregistrer ma carte'),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  // Action à effectuer lorsque le bouton est pressé
                },
                child: const Text('Payer')),
            // ],
            SizedBox(height: longueurEcran / 660),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (bool? value) {
                    setState(() {
                      // isChecked = value!;
                    });
                  },
                ),
                const Text(
                    'Je déclare sur honneur que les informations saisies sont correctes, et conformes à notre politique de confidentialité des données',
                    softWrap: true,
                ),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Payer')),
          ],
        ),
      ),
    );
  }
}
