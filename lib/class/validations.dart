import 'package:flutter/material.dart';

class Validacion with ChangeNotifier {

  

  validacionCodigoReunion(String valor) {
    if (valor.isEmpty){return valor = 'El codigo de reunion no es valido';}
    
    // if (msj.isNotEmpty) {
    //   validator = false;
    //   return msj;
    // }else{
    //   validator = true;
    // }

    return null;
  }

  validacionCodigoUsuario(String valor) {
    if (valor.isEmpty){return valor = 'El codigo de usuario no es valido';}
    
    // if (msj.isNotEmpty) {
    //   validator = false;
    //   return msj;
    // }else{
    //   validator = true;
    // }

    return null;
  }

//   validacionScreens(){

//     if(validacionCodigoReunion == '' || validacionCodigoUsuario == '' ){
//       debugPrint('Validacion de screens');
//       return true;
//     }

//     return false;
//   }
}
