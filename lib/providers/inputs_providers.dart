import 'package:cool_alert/cool_alert.dart';
import 'package:event_on_time/providers/auth_event_provider.dart';
import 'package:event_on_time/screens/screens.dart';
import 'package:flutter/material.dart';
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
      event.validar();
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Por favor espere'),
                content: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(top: 20),
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                    )),
              ));
      Future.delayed(const Duration(seconds: 2), () {
        if (event.isData) {
          Map<String, dynamic> map = event.mapaString();
          Navigator.pushReplacementNamed(context, InviteScreen.route,
              arguments: map);
        } else {
          debugPrint('Se tardo en responder');
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
        text: "Esta invitación no es valida ",
        type: CoolAlertType.error,
        confirmBtnColor: Colors.amber);
  }

  error2(BuildContext context) {
    CoolAlert.show(
        context: context,
        text: "Credenciales no validas, intenta de nuevo",
        type: CoolAlertType.error,
        confirmBtnColor: Colors.amber);
  }
}
