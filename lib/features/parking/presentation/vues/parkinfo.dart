import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karz/core/constants/colors.dart';
import 'package:karz/core/constants/dimensions.dart';
import 'package:karz/core/widgets/heading1.dart';
import 'package:karz/core/widgets/heading2.dart';
import 'package:karz/core/widgets/standard_text.dart';
import 'package:karz/features/parking/data/models/parking_model.dart';
import 'package:karz/features/parking/presentation/app/controllers/parking_controller.dart';
import 'package:karz/features/reservation/presentation/vues/interaface_reservation.dart';

class Parkinfo extends StatefulWidget {
  const Parkinfo({super.key, required this.parking});

  final ParkingModel parking;
  @override
  State<Parkinfo> createState() => _Parkinfo();
}

class _Parkinfo extends State<Parkinfo> {
  ParkingController parkingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          // Changer cette icône à ce que vous voulez
          onPressed: () {
            Navigator.pop(context); // Revenir à la page précédente
            //print("Icône de l'AppBar cliquée");
          },
        ),
        title: const Heading1(
          text: 'Parking info',
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 300.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('asset/images/parking.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Heading1(
                        text: widget.parking.address.fullAddress,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  SizedBox(height: height10,),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(
                        width: width2,
                      ),
                      StandardText(
                          text:
                              "${widget.parking.rate} / ${widget.parking.reviewsNumber} avis"),
                    ],
                  ),
                  SizedBox(height: height10,),
                  const Divider(
                    // Ligne pleine
                    height: 3, // Hauteur de la ligne
                    thickness: 1, // Épaisseur de la ligne
                    color: Colors.black, // Couleur de la ligne
                  ),
                  SizedBox(height: height10,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Heading2(
                          text: "1h",
                          fontWeight: FontWeight.bold,
                        ),
                        Heading2(
                            text: "${widget.parking.reservationPrice} MAD",
                            fontWeight: FontWeight.bold)
                      ]),
                ],
              )),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          parkingController.currentParking = widget.parking;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const InterfaceReservation()),
          );
        },
        child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: marginW16, vertical: marginH16),
            padding: EdgeInsets.symmetric(vertical: paddingH10),
            decoration: BoxDecoration(
              color: secondary, 
              borderRadius: BorderRadius.circular(radius15)
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Heading2(
                  text: 'Réserver',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            )),
      ),
    );
  }
}
