
import 'package:flutter/material.dart';
import 'package:karz/core/constants/colors.dart';
import 'package:karz/core/constants/dimensions.dart';
import 'package:karz/core/utilities/enum.dart';
import 'package:karz/core/widgets/heading1.dart';
import 'package:karz/core/widgets/heading2.dart';
import 'package:karz/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:karz/features/authentification/presentation/vues/sidebar.dart';
import 'package:karz/features/parking/presentation/vues/parklist.dart';
import 'package:karz/features/reservation/presentation/app/bloc/controllers/reservation_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.find();
  ReservationController reservationController = Get.find();
  final TextEditingController _address = TextEditingController();

  final Rx<VehiculeType> _selectedType = VehiculeType.voiture.obs;
  final _type = <dynamic>[
    "Voiture",
    "Deux roues (moto, etc...)",
    "Mini bus / Van"
  ];

  @override
  void initState() {
    debugPrint("========== USER: ${userController.currentConductor}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      drawer: Sidebar(conductor: userController.currentConductor),
      appBar: AppBar(
        centerTitle: true,
        title: const Heading1(text: "Karz"),
      ),
      body: Stack(
        children: [
          Image.asset(
            "asset/images/localisation.jpg",
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          /*Positioned(
            top: marginH32,
            left: 0,
            right: 0,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              *//* IconButton(
                onPressed:() => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: secondary,
                  size: font24*2,
                ),
              ), *//*
              Text(
                "Karz",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: "Itim",
                    color: secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: font24*2
                ),
              ),
            ],
          ),
          ),*/
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: height220 * 1.25),
              padding: EdgeInsets.symmetric(
                  vertical: paddingH24 * 3,
                  horizontal: paddingW20
              ),
              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius30),
                    topRight: Radius.circular(radius30)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _address,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: "Où Allez vous?",
                      hintText: "Ex: 13, rue Abdellah, Rabat",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius15),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      labelStyle: TextStyle(
                          fontSize: font14 + 2,
                          fontWeight: FontWeight.bold,
                          color: secondary
                      ),
                      hintStyle: TextStyle(
                          fontSize: font14 + 2, //16
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFB3B3B3)
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primary),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.deepOrange, // Définit la couleur du texte saisi
                      fontSize: 16, // Optionnel : taille de la police
                      fontWeight: FontWeight.bold, // Optionnel : poids de la police
                    ),
                  ),
                  SizedBox(height: height24,),
                  DropdownButtonFormField<VehiculeType>(
                    value: _selectedType.value,
                      //style: TextStyle(color: Colors.blueAccent),
                      dropdownColor: primary,
                    items: List.generate(
                      _type.length,
                      (index) => DropdownMenuItem(
                        value: switch(_type[index]) {
                          "Voiture" => VehiculeType.voiture,
                          "Deux roues (moto, etc...)" => VehiculeType.deuxRoues,
                          "Mini bus / Van" => VehiculeType.miniBus,
                          String() => null,
                          Object() => null,
                          null => null,
                        },
                        child: Heading2(
                          text: _type[index],
                          color: secondary,
                        )
                      )
                    ),
                    onChanged: (value) {
                      if(value != null) {
                        _selectedType.value = value;
                      }
                    }
                  ),
                  SizedBox(height: height24,),
                  InkWell(
                    onTap: () {
                      reservationController.currentVehicule = reservationController.currentVehicule.copyWith(type: _selectedType.value);
                      Get.to(() => const ParkList());
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: paddingH16),
                      decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(radius15)
                      ),
                      child: const Heading2(
                        text: "Valider",
                        color: Colors.white,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )

    );
  }
}
