import 'package:event_on_time/screens/screens.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
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
                    radius: 40,
                    child: Image.asset('assets/images/Logo.png'), //CircleAvatar
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Nombre de la persona',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
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
          const Divider(),
          ElevatedButton(
            
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () {},
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
