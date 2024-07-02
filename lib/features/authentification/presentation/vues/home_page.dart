
import 'package:flutter/material.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      drawer: Sidebar(conductor: userController.currentConductor),
       appBar: AppBar(
         title: Text("Titre"),
       ),
      body: Stack(
        children: [
          Image.asset(
            "asset/images/localisation.jpg",
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: marginH32,
            left: 0,
            right: 0,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed:() => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: secondary,
                  size: font24*2,
                ),
                child: const Text(
                  'Deconnexion',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim'
                  ),
                ),
              ),
            ],
          ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: height220 * 2),
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
                    style: TextStyle(
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
                    onTap: () => Get.to(const InterfaceReservation()),
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

     /* CustomScrollView(
        slivers: [
          SliverAppBar(
            clipBehavior: Clip.none,
            leading: IconButton(
              onPressed:() => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu,
                color: secondary,
                size: font24*2,
              ),
            ),
            title: Text(
              "Karz",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: "Itim",
                color: secondary,
                fontWeight: FontWeight.bold,
                fontSize: font24*2
              ),
            ),
            expandedHeight: height220 + height100,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "asset/images/localisation.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    top: -50,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                          vertical: paddingH24,
                          horizontal: paddingW16
                      ),
                      decoration: BoxDecoration(
                          color: secondary,
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
                                  color: const Color(0xFFB3B3B3)
                              ),
                              hintStyle: TextStyle(
                                  fontSize: font14 + 2, //16
                                  fontWeight: FontWeight.bold
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: primary),
                              ),
                            ),
                          ),
                          SizedBox(height: height16,),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: double.maxFinite,
                              padding: EdgeInsets.symmetric(vertical: paddingH10),
                              decoration: BoxDecoration(
                                color: secondary,
                                borderRadius: BorderRadius.circular(radius15)
                              ),
                              child: const Heading2(text: "Valider", color: Colors.white, textAlign: TextAlign.center,),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )*/
    );
  }
}
