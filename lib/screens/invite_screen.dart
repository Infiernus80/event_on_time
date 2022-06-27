import 'package:flutter/material.dart';

class InviteScreen extends StatelessWidget {
  static String route = "InviteScreen";
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Scaffold(
        body: Center(
          child: Text('Proximamente....',style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
    );
  }
}
