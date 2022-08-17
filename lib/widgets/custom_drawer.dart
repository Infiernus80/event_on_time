import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_on_time/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../providers/auth_stadistic_user.dart';
import '../providers/auth_user_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthUserProvider user = Provider.of<AuthUserProvider>(context);
    AuthStadisticUserProvider stadistic = Provider.of<AuthStadisticUserProvider>(context);
    Map map = user.mapaString();
    // debugPrint('${user.mapaString()}');
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 45.w,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                
                color: Color.fromRGBO(83, 111, 138, 1),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(83, 111, 138, 1),
                      radius: 10.w,
                      child: FadeInImage.assetNetwork(image: map['picture']['url'],placeholder: 'assets/images/logo.png',), //CircleAvatar
                    ),
                    AutoSizeText(
                      map['name'],
                      style: const TextStyle(color: Colors.white),
                      maxLines: 2,
                    ),
                    AutoSizeText(
                      'Tipo de cuenta: ${map['account']}',
                      style: const TextStyle(color: Colors.white,fontSize:15),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ItemCustomDrawer(
            txt: 'Inicio',
            icon: Icons.home,
            funtion: () {
              Navigator.pushReplacementNamed(context, OrganizerScreen.route);
            },
          ),
          ItemCustomDrawer(
            txt: 'Mis invitaciones',
            icon: Icons.list,
            funtion: () {
                Navigator.pushReplacementNamed(context, MyInvitesScreen.route);
            },
          ),
          SizedBox(
            height: 55.h,
          ),
          const Divider(),
          ElevatedButton(
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginScreen.route);
            },
            child: const Text('Cerrar sesion'),
          )
        ],
      ),
    );
  }
}

class ItemCustomDrawer extends StatelessWidget {
  const ItemCustomDrawer({
    Key? key,
    required this.txt,
    required this.icon,
    required this.funtion,
  }) : super(key: key);
  final String txt;
  final IconData icon;
  final Function funtion;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icon,
            // color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              txt,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      onTap: () => funtion(),
    );
  }
}
