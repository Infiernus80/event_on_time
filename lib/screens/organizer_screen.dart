import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_on_time/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../providers/auth_user_provider.dart';
import '../widgets/custom_grap.dart';

class OrganizerScreen extends StatelessWidget {
  static String route = 'OrganizerScreen';
  const OrganizerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthUserProvider user = Provider.of<AuthUserProvider>(context);

    debugPrint('${user.mapaString()}');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(83, 111, 138, 1),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 90.w,
              child: Lottie.asset('assets/images/welcom.json', repeat: false),
            ),
          ),
          const AutoSizeText(
            'BIENVENIDO',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
          const Graficas()
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}

