import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/core/constants/dimensions.dart';
import 'package:ulysse_app/core/widgets/standard_text.dart';
import 'package:ulysse_app/features/authentification/data/models/conductor_model.dart';
import 'package:ulysse_app/features/authentification/presentation/app/bloc/authentication_bloc.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/interface_login.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/myprofile.dart';
import 'package:ulysse_app/features/reservation/presentation/vues/historique.dart';
import 'interface_abonnement.dart';
import 'interfaceh_honoraire_gardien.dart';
import 'interface_parrainage.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
    required this.conductor
  });

  final ConductorModel conductor;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
      ListView(
        padding: EdgeInsets.all(paddingW16),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              conductor.name,
              style: TextStyle(
                fontFamily: 'Itim',
                fontSize: font20
              )
            ),
            accountEmail: StandardText(text: conductor.phone, fontWeight: FontWeight.bold,),
            currentAccountPicture: Center(
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: primary,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ClipOval(
                            child: Center(child:
                            Text(
                                conductor.name[0].toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'Itim',
                                    fontSize: font24,
                                    color: secondary
                                )
                            ),)
                        ),
                      )
                    ],
                  )
              ),
            )
          ),
          ListTile(
            leading: Icon(
              size: font24 + 6,
              Icons.account_circle_outlined,
            ),
            title: Text(
              'Mes informations',
              style: TextStyle(
                fontFamily: 'Itim', 
                fontSize: font24
              )
            ),
            onTap: () {
              // Navigation vers la nouvelle interface
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Myprofile()),
              );
            },
            //onTap: () => debugPrint('Mes informations'),
          ),
          ListTile(
            leading: Icon(
              size: font24 + 6,
              Icons.event_available_sharp,
            ),
            title: Text(
              'Mes réservations', 
              style: TextStyle(
                fontFamily: 'Itim', 
                fontSize: font24
              )
            ),
            onTap: () {
              // Navigation vers la nouvelle interface
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => History()),
              );
            },
            //onTap: () => debugPrint('Mes réservations'),
          ),
          const Divider( // Ligne pleine
            height: 3, // Hauteur de la ligne
            thickness: 3, // Épaisseur de la ligne
            color: Color(0xFFE9DEDE), // Couleur de la ligne
          ),
          ListTile(
            leading: Icon(
              size: font24 + 6,
              Icons.card_giftcard,
            ),
            title: Text(
              'Parrainez vos amis', 
              style: TextStyle(
                fontFamily: 'Itim', 
                fontSize: font24
              )
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InterfaceParrainage()),
              );
            }
          ),
          /*ListTile(
            leading: Icon(
              size: font24 + 6,
              Icons.local_offer_outlined
            ),
            title: Text(
              'Mon code promo', 
              style: TextStyle(
                fontFamily: 'Itim', 
                fontSize: font24
              )
            ),
            onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const InterfaceHonoraire()),
    );
    }
          ),*/
          /*ListTile(
            leading: Icon( 
              size: font24 + 6,
              Icons.workspace_premium_sharp,
              color:Colors.orange,
            ),
            title: Text(
              'Premium', 
              style: TextStyle(
                fontFamily: 'Itim', 
                fontSize: font24, 
                color: Colors.orange
              )
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InterfaceAbonnement()),
              );
            }),*/
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if(state is UserSignedOutState) {
                context.read<AuthenticationBloc>().add(SetUserLoggingStateEvent());
              }
              else if(state is UserLoggingStateModified) {
                Get.offAll(() => const InterfaceLogin());
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: marginH24),
              child: ListTile(
                leading: Icon(
                    size: font24 + 6,
                    Icons.power_settings_new
                ),
                title: Text(
                    'Deconnexion',
                    style: TextStyle(
                        fontFamily: 'Itim',
                        fontSize: font24
                    )
                ),
                onTap: () => context.read<AuthenticationBloc>().add(SignOutEvent()),
              ),
            ),
          ),
        ],
      )
    );
  }
}
