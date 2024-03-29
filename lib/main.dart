import 'package:event_on_time/class/invite_screen_class.dart';
import 'package:event_on_time/class/validations.dart';
import 'package:event_on_time/providers/auth_confirm_keeper.dart';
import 'package:event_on_time/providers/auth_event_provider.dart';
import 'package:event_on_time/providers/auth_stadistic_user.dart';
import 'package:event_on_time/providers/auth_user_provider.dart';
import 'package:event_on_time/providers/custom_dropdown.dart';
import 'package:event_on_time/providers/inputs_providers.dart';
import 'package:event_on_time/providers/keeper_scan.dart';
import 'package:event_on_time/providers/switch_provider.dart';
import 'package:event_on_time/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primary = const Color.fromRGBO(83, 111, 138, 1);
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ScreenArguments(),
          ),
          ChangeNotifierProvider(
            create: (context) => Validacion(),
          ),
          ChangeNotifierProvider(
            create: (context) => SwitchProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => InputProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthEventProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => KeeperGetProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CustomDropdown(),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthUserProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthStadisticUserProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthConfirmProvider(),
          ),
        ],
        child: ResponsiveSizer(builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'Event on time',
            debugShowCheckedModeBanner: false,
            routes: {
              HomeScreen.route: (context) => const HomeScreen(),
              LoginScreen.route: (context) => const LoginScreen(),
              InviteScreen.route: (context) => const InviteScreen(),
              KeeperScreen.route: (context) => const KeeperScreen(),
              OrganizerScreen.route: (context) => const OrganizerScreen(),
              MyInvitesScreen.route: (context) => const MyInvitesScreen(),
            },
            initialRoute: LoginScreen.route,
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: 'Inter',
                // Color de las letras
                primaryColor: Color.fromRGBO(228, 161, 147, 1),
                secondaryHeaderColor: primary,
                scaffoldBackgroundColor: primary,
                textTheme: const TextTheme(
                  titleSmall: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          );
        }),
      );
    });
  }
}
