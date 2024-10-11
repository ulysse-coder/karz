
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karz/core/constants/dimensions.dart';
import 'package:karz/core/utilities/enum.dart';
import 'package:karz/core/widgets/heading2.dart';
import 'package:karz/core/widgets/standard_text.dart';
import 'package:karz/features/reservation/data/models/reservation_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../authentification/presentation/vues/home_page.dart';

class ReservationHistoricItem extends StatelessWidget {
  const ReservationHistoricItem({super.key, required this.reservation});

  final ReservationModel reservation;

  @override
  Widget build(BuildContext context) {
    RxBool _isSelected = false.obs;
    RxBool _isWidgetVisible = false.obs;
    final _vehiculeTypeToString = {
      VehiculeType.voiture: "Voiture",
      VehiculeType.miniBus: "Mini bus",
      VehiculeType.deuxRoues: "Deux roues"
    };

    return Padding(
      padding: EdgeInsets.all(paddingW16),
      child: Align(
        alignment: Alignment.topCenter,
        child: Obx(() => SizedBox(
          // height: containerHeight,
          width: 375,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _isWidgetVisible.value = !_isWidgetVisible.value;
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 45,
                      color: Colors.black38,
                    ),
                  ),
                  StandardText(
                    text: reservation.parkingAddress,
                    fontWeight: FontWeight.bold,
                    color: primary,
                    fontSize: font14 + 2,
                  ),
                  IconButton(
                    icon: Icon(
                      _isSelected.value ? Icons.check_circle_sharp : Icons
                          .radio_button_unchecked_rounded,
                      color: _isSelected.value ? primary : primary,
                      // Utilisez les couleurs appropriées
                      size: 20,
                    ),
                    onPressed: () {
                        _isSelected.value = !_isSelected.value;
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
                Material(
                  elevation: 15,
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    child: Visibility(
                      visible: _isWidgetVisible.value,
                      child: Container(
                        padding: EdgeInsets.all(paddingW16),
                          // height: 110,
                          width: double.infinity,
                          child: Center(
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Heading2(
                                  text: 'Début : ${reservation.startTime}',
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: height10,),
                                Heading2(
                                  text: 'Fin : ${reservation.endTime}',
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: height10,),
                                Heading2(
                                  text: 'Type de véhicule : ${_vehiculeTypeToString[reservation.vehicule.type]}',
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const HomePage()),
                                      ),
                                      child: Container(
                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: secondary,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Détails',
                                                style: TextStyle(fontFamily: 'Itim', fontSize: 20),
                                              ),
                                            ],
                                          )
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                ),
            ],
          ),
        )),
      ),
    );
  }
}
