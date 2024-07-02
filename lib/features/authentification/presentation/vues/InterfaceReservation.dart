import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/home_page.dart';

import '../../../../core/utilities/enum.dart';

class InterfaceReservation extends StatefulWidget {
  const InterfaceReservation({Key? key}) : super(key: key);

  @override
  _InterfaceReservationState createState() => _InterfaceReservationState();
}

class _InterfaceReservationState extends State<InterfaceReservation> {
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
        title:  Text(
          'Réserver ma place',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: longueurEcran / 27.5, // 24
            fontWeight: FontWeight.bold,
            fontFamily: 'Italianno',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: longueurEcran / 66),

            Container(
              margin: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 12.47), // 5, 30
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Entrez votre N° de plaque',
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

            SizedBox(height: longueurEcran / 330),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 25), // 5, 15
                  child: TextField(
                    controller: _phone,
                    decoration: InputDecoration(
                      hintText: 'Entrez la durée',
                      contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 74.9), // 5, 10
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

                SizedBox(width: largeurEcran / 149.8), // 2.5

                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 25), // 5, 15
                  child: TextField(
                    controller: _date,
                    decoration: InputDecoration(
                      hintText: 'Heures/jours',
                      contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 37.5), // 10, 15
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
              ],
            ),
            SizedBox(height: longueurEcran / 330),

            Container(
              margin: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 12.47), // 5, 30
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Entrez la date de réservation',
                  contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 37.5), // 15, 15
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
                  suffixIcon: Image.asset(
                    'asset/icons/calendrier.png',
                    height: longueurEcran / 15, // 40
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: longueurEcran / 66),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Nb de places',
                  style: TextStyle(
                    fontSize: longueurEcran / 33, // 20
                    color: Colors.black,
                    fontFamily: 'Itim',
                  ),
                ),
                SizedBox(width: largeurEcran / 37.5), // 10
                Container(
                  padding: EdgeInsets.symmetric(horizontal: largeurEcran / 50, vertical: longueurEcran / 330), // 16, 5
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: longueurEcran / 33, // 20
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: longueurEcran / 66),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Nb de places disponibles',
                  style: TextStyle(
                    fontSize: longueurEcran / 33, // 20
                    color: Colors.black,
                    fontFamily: 'Itim',
                  ),
                ),
                SizedBox(width: largeurEcran / 37.5), // 10
                Container(
                  padding: EdgeInsets.symmetric(horizontal: largeurEcran / 50, vertical: longueurEcran / 330), // 16, 5
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Text(
                    'x',
                    style: TextStyle(
                      fontSize: longueurEcran / 33, // 20
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: longueurEcran / 66),

            Container(
              margin: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 12.47), // 5, 30
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Entrez le N° de plaque de la 2ème personne',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 25), // 5, 15
                  child: TextField(
                    controller: _phone,
                    decoration: InputDecoration(
                      hintText: 'Entrez la durée',
                      contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 74.9), // 5, 10
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

                SizedBox(width: largeurEcran / 149.8), // 2.5

                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 25), // 5, 15
                  child: TextField(
                    controller: _date,
                    decoration: InputDecoration(
                      hintText: 'Heures/jours',
                      contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 37.5), // 10, 15
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
              ],
            ),
            SizedBox(height: longueurEcran / 330),

            Container(
              margin: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 12.47), // 5, 30
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Entrez la date de réservation',
                  contentPadding: EdgeInsets.symmetric(vertical: longueurEcran / 330, horizontal: largeurEcran / 37.5), // 15, 15
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
                  suffixIcon: Image.asset(
                    'asset/icons/calendrier.png',
                    height: longueurEcran / 15, // 40
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: longueurEcran / 330),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 12.47), // 5, 30
                  child: TextButton(
                    onPressed: () {
                      // Handle Annuler button press
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFDA0E0E),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(longueurEcran / 6, largeurEcran / 12.33), // 20, 30
                      ),
                    ),
                    child: Text(
                      'Annuler',
                      style: TextStyle(
                        fontSize: longueurEcran / 33, // 20
                        fontFamily: 'Itim',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: largeurEcran / 74.9), // 5

                Container(
                  margin: EdgeInsets.symmetric(vertical: longueurEcran / 66, horizontal: largeurEcran / 12.47), // 5, 30
                  child: TextButton(
                    onPressed: () {
                      // Handle Réserver button press
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFFF7A00),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(longueurEcran / 6, largeurEcran / 12.33), // 20, 30
                      ),
                    ),
                    child: Text(
                      'Réserver',
                      style: TextStyle(
                        fontSize: longueurEcran / 33, // 20
                        fontFamily: 'Itim',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
