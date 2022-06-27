import 'package:event_on_time/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {     
    Color primary = const Color.fromRGBO(83, 111, 138, 1);
    return MaterialApp(
      title: 'Event on time',
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.route:(context) => const HomeScreen(),
      },
      initialRoute: HomeScreen.route,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        // Color de las letras
        primaryColor: Color.fromRGBO(228, 161, 147, 1),
        secondaryHeaderColor: primary,

        scaffoldBackgroundColor: primary,
        textTheme: const TextTheme(
          titleSmall: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.white)
        )
      ),
    );
  }
}