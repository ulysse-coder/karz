import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';

class InterfaceReservation extends StatefulWidget {
  const InterfaceReservation({Key? key}) : super(key: key);

  @override
  State<InterfaceReservation> createState() => _InterfaceReservationState();
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
        title: const Text(
          'Réserver ma place',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
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
            const SizedBox(height: 10),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Entrez votre N° de plaque',
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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

            const SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextField(
                    controller: _phone,
                    decoration: InputDecoration(
                      hintText: 'Entrez la durée',
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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

                const SizedBox(width: 5),

                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextField(
                    controller: _date,
                    decoration: InputDecoration(
                      hintText: 'Heures/jours',
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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

            const SizedBox(height: 10),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Entrez la date de réservation',
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  suffixIcon: Image.asset(
                    'asset/icons/calendrier.png',
                    height: longueurEcran / 15,
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Nb de places',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Itim',
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: longueurEcran / 30,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Nb de places disponibles',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Itim',
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Text(
                    'x',
                    style: TextStyle(
                      fontSize: longueurEcran / 30,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Entrez le N° de plaque de la 2ème personne',
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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

            const SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextField(
                    controller: _phone,
                    decoration: InputDecoration(
                      hintText: 'Entrez la durée',
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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

                const SizedBox(width: 5),

                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: TextField(
                    controller: _date,
                    decoration: InputDecoration(
                      hintText: 'Heures/jours',
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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
            const SizedBox(height: 10),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Entrez la date de réservation',
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  suffixIcon: Image.asset(
                    'asset/icons/calendrier.png',
                    height: longueurEcran / 15,
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextButton(
                    onPressed: () {
                      // Handle Annuler button press
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFDA0E0E),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(longueurEcran / 6, largeurEcran / 12.33),
                      ),
                    ),
                    child: const Text(
                      'Annuler',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Itim',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextButton(
                    onPressed: () {
                      // Handle Réserver button press
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFFF7A00),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(longueurEcran / 6, largeurEcran / 12.33),
                      ),
                    ),
                    child: const Text(
                      'Réserver',
                      style: TextStyle(
                        fontSize: 20,
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
