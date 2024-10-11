import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karz/core/constants/colors.dart';
import 'package:karz/core/constants/dimensions.dart';
import 'package:karz/core/widgets/heading2.dart';
import 'package:karz/core/widgets/standard_text.dart';
import 'package:karz/features/parking/data/models/parking_model.dart';
import 'package:karz/features/parking/presentation/vues/parkinfo.dart';

class ParkingListItem extends StatelessWidget {
  const ParkingListItem({super.key, required this.parking});

  final ParkingModel parking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingW16),
      child: InkWell(
          onTap: () {
            Get.to(() => Parkinfo(parking: parking));
          },
          child: Card(
            child: Container(
              margin: EdgeInsets.only(top: marginH16),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: const AssetImage('asset/images/parking.jpg'),
                    width: double.maxFinite,
                    height: height100,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.all(paddingW20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Heading2(
                            text: parking.address.fullAddress,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: height16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.orange, size: 16),
                                  SizedBox(
                                    width: width2,
                                  ),
                                  StandardText(
                                      text:
                                      "${parking.rate} / ${parking.reviewsNumber} avis"),
                                ],
                              ),
                              StandardText(
                                text: "${parking.reservationPrice} MAD",
                                fontWeight: FontWeight.bold,
                                fontSize: font14 + 2,
                                color: secondary,
                              )
                            ],
                          )
                        ]
                    )
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
