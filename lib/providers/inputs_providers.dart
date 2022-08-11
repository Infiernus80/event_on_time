import 'package:auto_size_text/auto_size_text.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:event_on_time/providers/auth_event_provider.dart';
import 'package:event_on_time/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:validated/validated.dart' as validate;

class InputProvider with ChangeNotifier {
  final campo1 = TextEditingController();
  final campo2 = TextEditingController();

  AuthEventProvider event = AuthEventProvider();

  validations(BuildContext context, bool switchP) {
    String correo = '';
    String contra = '';
    int cReunion = 0;
    int cUsuario = 0;
    BuildContext dialogContext = context;

    if (!switchP) {
      //Los datos del controlador se ponen en sus respectivas variables
      cReunion = (campo1.text.isEmpty) ? 0 : int.parse(campo1.text);
      cUsuario = (campo2.text.isEmpty) ? 0 : int.parse(campo2.text);
    } else {
      correo = campo1.text;
      contra = campo2.text;
    }

    if (correo != '' && contra != '') {
      if (validate.isEmail(correo) && contra.length >= 8) {
        debugPrint('Esto es una cuenta');
      }
    } else if (cReunion != 0 && cUsuario != 0) {
      event.validar(cReunion, cUsuario);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          dialogContext = context;
          return Dialog(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                LottieBuilder.asset(
                  'assets/images/loading.json',
                  width: 100,
                ),
                const Text("Por favor espere..."),
              ],
            ),
          );
        },
      );
      Future.delayed(const Duration(seconds: 2), () {
        if (event.isData) {
          Navigator.pop(dialogContext);
          Map<String, dynamic> map = event.mapaString();
          if (map['guest']['role'] == 'Invitado') {
            Navigator.pushReplacementNamed(context, InviteScreen.route,
                arguments: map);
          } else if (map['guest']['role'] == 'Cadenero') {
            Navigator.pushReplacementNamed(context, KeeperScreen.route,
                arguments: map);
          }
        } else {
          Navigator.pop(dialogContext);
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              dialogContext = context;
              return Dialog(
                child: Container(
                  // height: 70.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.w),
                        child: LottieBuilder.asset(
                          'assets/images/error.json',
                          width: 200,
                        ),
                      ),
                      Container(
                        width: 50.w,
                        child: const AutoSizeText(
                          "Por favor intentalo de nuevo...",
                          style: TextStyle(fontSize: 20),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 90.w,
                        margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.w),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            
                            backgroundColor: Colors.amber
                          ),
                          onPressed: () {
                            Navigator.pop(dialogContext);
                          },
                          child: Text('Aceptar',style: TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      });
    } else {
      if (!switchP) {
        error1(context);
      } else {
        error2(context);
      }
    }
    notifyListeners();
  }

  error1(BuildContext context) {
    CoolAlert.show(
        context: context,
        text: "Por favor llena los campos",
        type: CoolAlertType.error,
        confirmBtnColor: Colors.amber);
  }

  error2(BuildContext context) {
    CoolAlert.show(
        context: context,
        text: "Por favor llena los campos",
        type: CoolAlertType.error,
        confirmBtnColor: Colors.amber);
  }
}
