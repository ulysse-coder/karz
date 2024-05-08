
import 'package:flutter/material.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/core/constants/dimensions.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.find();
  final TextEditingController _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(conductor: userController.currentConductor),
      // backgroundColor: primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed:() => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu,
                color: secondary,
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
            flexibleSpace: Image.asset(
              "asset/images/localisation.jpg",
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Positioned(
                  top: height220 - height24,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      vertical: paddingH24,
                      horizontal: paddingW16
                    ),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius30),
                        topRight: Radius.circular(radius30)
                      )
                    ),
                    child: Column(
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
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
