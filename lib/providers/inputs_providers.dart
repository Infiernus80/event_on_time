import 'package:cool_alert/cool_alert.dart';
import 'package:event_on_time/providers/switch_provider.dart';
import 'package:flutter/material.dart';
import 'package:validated/validated.dart' as validate;

class InputProvider with ChangeNotifier {
  final campo1 = TextEditingController();
  final campo2 = TextEditingController();

  final SwitchProvider switchP = SwitchProvider();

  validations(BuildContext context) {
    String correo = '';
    String contra = '';
    int cReunion = 0;
    int cUsuario = 0;

    if (switchP.isInvitateGet == false) {
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
      debugPrint('Esto es una invitacion');
    } else {
      if (switchP.isInvitateGet == false) {
        error1(context);
      }
    }

    notifyListeners();
  }

  error1(BuildContext context) {
    CoolAlert.show(
        context: context,
        text: "Credenciales no validas,intenta de nuevo",
        type: CoolAlertType.error,
        confirmBtnColor: Colors.amber);
  }
}
