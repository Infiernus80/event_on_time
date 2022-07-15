import 'package:event_on_time/class/invite_screen_class.dart';
import 'package:event_on_time/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primary = const Color.fromRGBO(83, 111, 138, 1);
    return ChangeNotifierProvider(
      create: (context) => ScreenArguments(),
      child: MaterialApp(
        title: 'Event on time',
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.route: (context) => const HomeScreen(),
          InviteScreen.route: (context) => const InviteScreen(),
          KeeperScreen.route: (context) => const KeeperScreen(),
        },
        initialRoute: InviteScreen.route,
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Inter',
            // Color de las letras
            primaryColor: const Color.fromRGBO(228, 161, 147, 1),
            secondaryHeaderColor: primary,
            scaffoldBackgroundColor: primary,
            textTheme: const TextTheme(
              titleSmall: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ),
    );
  }
}
