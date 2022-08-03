import 'package:event_on_time/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class OrganizerScreen extends StatelessWidget {
  static String route = 'OrganizerScreen';
  const OrganizerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(83, 111, 138, 1),
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('Hola'),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
