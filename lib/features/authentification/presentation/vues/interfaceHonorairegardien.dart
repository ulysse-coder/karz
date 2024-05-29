interface honoraire gardien
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InterfaceHonoraire(),
    );
  }
}

class InterfaceHonoraire extends StatefulWidget {
  const InterfaceHonoraire({super.key});

  @override
  State<InterfaceHonoraire> createState() => _InterfaceHonoraireState();
}

class _InterfaceHonoraireState extends State<InterfaceHonoraire> {

  bool _isChecked = false;
  List<String> _selectedDays = [];
  final List<String> _daysOfWeek = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche'
  ];

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
          'Renseigner les honoraires',
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
            // Action de retour
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(largeurEcran / 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: longueurEcran / 41.07), // 15
            Text(
              'Renseignez vos heures de travail',
              style: TextStyle(
                fontSize: longueurEcran / 30.8, // 20
                color: Colors.black,
                fontFamily: 'Itim',
              ),
            ),
            SizedBox(height: longueurEcran / 41.07), // 15

            GestureDetector(
              onTap: () => _selectDays(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  _selectedDays.isEmpty
                      ? 'Selectionnez vos jours de travail'
                      : _selectedDays.join(', '),
                  style: TextStyle(
                    fontSize: longueurEcran / 41.07, // 15
                    color: Colors.black,
                    fontFamily: 'Itim',
                  ),
                ),
              ),
            ),
            SizedBox(height: longueurEcran / 41.07), // 15
            Row(
              children: [
                Text(
                  'De:',
                  style: TextStyle(
                    fontSize: longueurEcran / 30.8, // 20
                    color: Colors.black,
                    fontFamily: 'Itim',
                  ),
                ),
                SizedBox(width: largeurEcran / 3),
                _buildTimeField('08'),
                Text(
                  ':',
                  style: TextStyle(
                    fontSize: longueurEcran / 30.8, // 20
                    color: Colors.black,
                    fontFamily: 'Itim',
                  ),
                ),
                _buildTimeField('00'),
              ],
            ),
            SizedBox(height: longueurEcran / 41.07), // 15

            Row(
              children: [
                Text(
                  'A:',
                  style: TextStyle(
                    fontSize: longueurEcran / 30.8, // 20
                    color: Colors.black,
                    fontFamily: 'Itim',
                  ),
                ),
                SizedBox(width: largeurEcran / 3),
                _buildTimeField('20'),
                Text(
                  ':',
                  style: TextStyle(
                    fontSize: longueurEcran / 30.8, // 20
                    color: Colors.black,
                    fontFamily: 'Itim',
                  ),
                ),
                _buildTimeField('00'),
              ],
            ),
            SizedBox(height: longueurEcran / 41.07), // 15
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Text(
                  'Je travaille du lundi au samedi',
                  style: TextStyle(
                    fontSize: longueurEcran / 41.07, // 15
                    fontFamily: 'Itim',
                  ),
                ),
              ],
            ),
            SizedBox(height: longueurEcran / 41.07), // 15

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
                  'Valider',
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

  Widget _buildTimeField(String initialValue) {
    return Container(
      width: 50,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        controller: TextEditingController(text: initialValue),
        keyboardType: TextInputType.number,
      ),
    );
  }

  void _selectDays(BuildContext context) async {
    final selectedValues = await showDialog<Set<String>>(
      context: context,
      builder: (BuildContext context) {
        final Set<String> selectedDays = Set.from(_selectedDays);
        return AlertDialog(
          title: const Text('Selectionnez vos jours de travail'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: _daysOfWeek.map((day) {
                  return CheckboxListTile(
                    title: Text(day),
                    value: selectedDays.contains(day),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          value
                              ? selectedDays.add(day)
                              : selectedDays.remove(day);
                        }
                      });
                    },
                  );
                }).toList(),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ANNULER'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(selectedDays);
              },
            ),
          ],
        );
      },
    );

    if (selectedValues != null) {
      setState(() {
        _selectedDays = selectedValues.toList()
          ..sort((a, b) =>
              _daysOfWeek.indexOf(a).compareTo(_daysOfWeek.indexOf(b)));
      });
    }
  }
}

//redonne le code complet en prenant en compte que si on coche je travaille du lundi au samedi, selectionnez vos jours de travail, devient inactif
