import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InterfaceParrainage(),
    );
  }
}


class InterfaceParrainage extends StatefulWidget {
  const InterfaceParrainage({super.key});

  @override
  State<InterfaceParrainage> createState() => _InterfaceParrainageState();
}

class _InterfaceParrainageState extends State<InterfaceParrainage> {

  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();

    debugPrint('Largeur de l\'écran: $largeurEcran');
    debugPrint('Longueur de l\'écran: $longueurEcran');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE5E5E5),
        title: Text(
          'Parrainage',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: (longueurEcran / 25.67), // 24
            fontWeight: FontWeight.bold,
            fontFamily: 'Itim',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {

          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [

            Image.asset(
              'asset/images/gift_picture.png',
              fit: BoxFit.cover,
              height: (longueurEcran / 2.46), //250
            ),

            SizedBox(height: 16.0),

            Text(
              'Invitez vos amis et gagnez des crédits',
              style: TextStyle(
                fontSize: longueurEcran / 50.8, // 20
                color: Colors.black,
                fontFamily: 'Itim',
              ),
            ),

            Text(
              'Pour le premier stationnement de vos amis, vous gagnez...',
              style: TextStyle(
                fontSize: longueurEcran / 50.8, // 20
                color: Colors.black,
                fontFamily: 'Itim',
              ),
            ),

            SizedBox(height: 200),

            Text(
              'Partager votre code dinvitation',
              style: TextStyle(
                fontSize: longueurEcran / 50.8, // 20
                color: Colors.black,
                fontFamily: 'Itim',
              ),
            ),

            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'D512D3',
                style: TextStyle(
                  fontSize: longueurEcran / 50.8, // 20
                  color: Colors.black,
                  fontFamily: 'Itim',
                ),
              ),
            ),
            SizedBox(height: 10),

            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFFF7A00)),
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(largeurEcran / 3, longueurEcran / 15)),
                ),
                onPressed: () {
                  // Action de validation
                },
                child: Text(
                  'Partager',
                  style: TextStyle(
                    fontSize: longueurEcran / 30.8, // 20
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
