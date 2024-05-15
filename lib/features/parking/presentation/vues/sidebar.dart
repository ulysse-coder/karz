import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
        Theme(
        data: Theme.of(context).copyWith(
      iconTheme: IconThemeData(
        color: Colors.red, // Définit la couleur de l'icône
      ),
    ),child:
      ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Username',style: TextStyle(fontFamily: 'Itim'),),

            accountEmail:null,
          currentAccountPicture:
              CircleAvatar(
                              child: ClipOval(
                                        child: Image.asset('asset/images/localisation.jpg',
                                                            width: 90,
                                                            height: 90,
                                                            fit: BoxFit.cover,
                                                          ),
                                              )
                                        ),
          decoration: BoxDecoration(
            color: Colors.orange,
          ),
          ),
          ListTile(
            leading: Icon( size: 30,Icons.account_circle_outlined),
            title: Text('Mes informations', style: TextStyle(fontFamily: 'Itim', fontSize: 23)),
            onTap: () => print('Mes informations'),
          ),
          ListTile(
            leading: Icon( size: 30,Icons.event_available_sharp),
            title: Text('Mes réservations', style: TextStyle(fontFamily: 'Itim', fontSize: 23)),
            onTap: () => print('Mes réservations'),
          ),
          ListTile(
            leading: Icon( size: 30,Icons.history),
            title: Text('Historique', style: TextStyle(fontFamily: 'Itim', fontSize: 23)),
            onTap: () => print('Historique'),
          ),
          Divider( // Ligne pleine
            height: 3, // Hauteur de la ligne
            thickness: 3, // Épaisseur de la ligne
            color: Color(0xFFE9DEDE), // Couleur de la ligne
          ),
          ListTile(
            leading: Icon( size: 30,Icons.card_giftcard),
            title: Text('Parrainez vos amis', style: TextStyle(fontFamily: 'Itim', fontSize: 23)),
            onTap: () => print('Parrainez vos amis'),
          ),
          ListTile(
            leading: Icon( size: 30,Icons.local_offer_outlined),
            title: Text('Mon code promo', style: TextStyle(fontFamily: 'Itim', fontSize: 23)),
            onTap: () => print('Mon code promo'),
          ),
          ListTile(
            leading: Icon( size: 30, color: Colors.orange,Icons.workspace_premium_sharp),
            title: Text('Premium', style: TextStyle(fontFamily: 'Itim', fontSize: 23, color: Colors.orange)),
            onTap: () => print('Premium'),
          ),
          Divider( // Ligne pleine
            height: 180, // Hauteur de la ligne
            thickness: null, // Épaisseur de la ligne
            color: Colors.transparent, // Couleur de la ligne
          ),
          ListTile(
            leading: Icon( size: 30,Icons.power_settings_new),
            title: Text('Deconnexion', style: TextStyle(fontFamily: 'Itim', fontSize: 23)),
            onTap: () => print('Deconnexion'),
          ),
        ],
      )
    ));
  }
}
