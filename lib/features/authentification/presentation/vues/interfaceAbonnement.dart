import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InterfaceAbonnement(),
    );
  }
}

class InterfaceAbonnement extends StatefulWidget {
  const InterfaceAbonnement({super.key});

  @override
  State<InterfaceAbonnement> createState() => _InterfaceAbonnementState();
}

class _InterfaceAbonnementState extends State<InterfaceAbonnement> {
  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();
    int longueurEcran = MediaQuery.of(context).size.height.floor();

    debugPrint('Largeur de l\'écran: $largeurEcran');
    debugPrint('Longueur de l\'écran: $longueurEcran');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD3D3D3),
        title: Text(
          'Abonnement Premium',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Itim',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Add your onPressed code here!
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 7),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF14213D), // Updated color
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Premium',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Itim',
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF14213D)), // Updated color
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      color: const Color(0xFF14213D), // Updated color
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Text(
                        'Mensuel',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Itim',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Avantage\nAvantage\nAvantage\nAvantage',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Itim',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 7.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF14213D), // Updated color
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        'Tarif',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'Itim',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Text(
                        'Annuel',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Itim',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Avantage\nAvantage\nAvantage\nAvantage',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Itim',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 7.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        'Tarif',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'Itim',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
