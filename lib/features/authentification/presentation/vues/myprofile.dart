import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
//import 'package:ulysse_app/core/widgets/standard_text.dart';

class Myprofile extends StatefulWidget{
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile>{
  UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new), // Changer cette icône à ce que vous voulez
          onPressed: () {
            Navigator.pop(context); // Revenir à la page précédente
            //print("Icône de l'AppBar cliquée");
          },
        ),
        title: const Row(
          children: [
            Text('Mes informations', style: TextStyle(fontFamily: 'Itim'),),
          ],
        ),
        backgroundColor: Colors.grey,
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 20, top: 0.0, right: 0.0, bottom: 20),
          width: 395,
          height: 500,
          child:
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espacement égal entre les lignes
                    children: [
                    CircleAvatar(
                    radius: 50, // Taille de l'avatar
                    backgroundColor: primary,
                    child: ClipOval(
                        child: Image.asset('asset/images/photop.png')// Image de profil
                  ),),
                      //SizedBox(height: 10), // Espacement entre l'image de profil et le texte
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Nom' , style: TextStyle(fontFamily: 'Itim', fontSize: 18, fontWeight: FontWeight.bold, color: secondary),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(userController.currentConductor.name , style: TextStyle(fontFamily: 'Itim', fontSize: 16, color: primary),),
                            ],
                          ),
                        ],
                      ),
                      const Divider( // Ligne pleine
                        height: 0, // Hauteur de la ligne
                        thickness: 1, // Épaisseur de la ligne
                        color: Color(0xFFE9DEDE), // Couleur de la ligne
                      ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Prénoms' , style: TextStyle(fontFamily: 'Itim', fontSize: 18, fontWeight: FontWeight.bold, color: secondary),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userController.currentConductor.name , style: TextStyle(fontFamily: 'Itim', fontSize: 16, color: primary),),
                        ],
                      ),],
                  ),
                      const Divider( // Ligne pleine
                        height: 0, // Hauteur de la ligne
                        thickness: 1, // Épaisseur de la ligne
                        color: Color(0xFFE9DEDE), // Couleur de la ligne
                      ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mail' , style: TextStyle(fontFamily: 'Itim', fontSize: 18, fontWeight: FontWeight.bold, color: secondary),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mail1234@utilisateur.com' , style: TextStyle(fontFamily: 'Itim', fontSize: 16, color: primary),),
                        ],
                      ),],
                  ),
                      const Divider( // Ligne pleine
                        height: 0, // Hauteur de la ligne
                        thickness: 1, // Épaisseur de la ligne
                        color: Color(0xFFE9DEDE), // Couleur de la ligne
                      ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Numéro de téléphone' , style: TextStyle(fontFamily: 'Itim', fontSize: 18, fontWeight: FontWeight.bold, color: secondary),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userController.currentConductor.phone , style: TextStyle(fontFamily: 'Itim', fontSize: 16, color: primary),),
                        ],
                      )],
                  ),
                      ],
                  ),
                ),
              //],
            //),
        )


    );}
}