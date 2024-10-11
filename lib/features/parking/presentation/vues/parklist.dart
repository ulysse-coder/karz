import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:karz/core/widgets/heading1.dart';
import 'package:karz/features/parking/data/models/parking_model.dart';
import 'package:karz/features/parking/presentation/app/bloc/parking_bloc.dart';
import 'package:karz/features/parking/presentation/app/controllers/parking_controller.dart';
import 'package:karz/features/parking/presentation/vues/parking_list_item.dart';

class ParkList extends StatefulWidget {
  const ParkList({super.key});

  @override
  State<ParkList> createState() => _ParkList();
}

class _ParkList extends State<ParkList> {
  ParkingController parkingController = Get.find();

  @override
  void initState() {
    super.initState();
    context.read<ParkingBloc>().add(GetAllParkingsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new), // Changer cette icône à ce que vous voulez
          onPressed: () {
            Navigator.pop(context); // Revenir à la page précédente
            //print("Icône de l'AppBar cliquée");
          },
        ),
        title: const Text(
          'Parkings',
          style: TextStyle(fontFamily: 'Itim'),
        ),
      ),
      body: BlocBuilder<ParkingBloc, ParkingState>(
        builder: (_, state) {
          debugPrint("========= $state");
          if (state is ParkingLoadedState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AllParkingsLoaded) {
            parkingController.parkings = state.parkings as List<ParkingModel>;

            return ListView.builder(
              itemCount: parkingController.parkings.length,
              itemBuilder: (context, index) => ParkingListItem(parking: parkingController.parkings[index])
            );
          }

          return ListView.builder(
            itemCount: parkingController.parkings.length,
            itemBuilder: (context, index) => ParkingListItem(parking: parkingController.parkings[index])
          );

          // return const Center(
          //   child: Heading1(text: "Une erreur s'est produite"),
          // );
        },
      )
      
      /* Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('day.dd/mm',
                    style: TextStyle(
                        fontFamily: 'Itim',
                        fontSize: 20,
                        color: Colors.orange)),
                Icon(Icons.arrow_forward_ios, color: Colors.orange),
                Text('day.dd/mm',
                    style: TextStyle(
                        fontFamily: 'Itim',
                        fontSize: 20,
                        color: Colors.orange)),
              ],
            ),
          ),
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'asset/images/location.png'), // Remplacez par le chemin de votre image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ville-adresse-immeuble',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Parkinfo()),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star_border, size: 16),
                      SizedBox(width: 8.0),
                      Text('n avis'),
                    ],
                  ),
                  Text('Adresse détail',
                      style: TextStyle(color: Colors.grey)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Time'),
                      Text('Tarif', style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ) */
    );
  }
}
