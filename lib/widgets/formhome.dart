import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../class/validations.dart';

class FormHome extends StatelessWidget {
  FormHome({Key? key}) : super(key: key);

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Validacion val = Provider.of<Validacion>(context);
    return Expanded(
      child: Form(
        key: _keyForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Texto(
              texto: 'Código de reunión',
              altura: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                validator: (valor) {
                  return val.validacionCodigoReunion(valor!);
                },
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                decoration: decoracionInput(),
              ),
            ),
            const Texto(
              texto: 'Código de usuario',
              altura: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                validator: (valor) {
                  return val.validacionCodigoUsuario(valor!).toString();
                },
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                decoration: decoracionInput(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
                  child: SizedBox(
                    width: 300,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          // Navigator.pushReplacementNamed(
                          //     context, InviteScreen.route,
                          //     arguments:ScreenArguments().numeroInviteGet);
                          // val.validacionScreens();
                          debugPrint('Si funciona');
                        } else {
                          CoolAlert.show(
                              context: context,
                              text: "Por favor llena los campos solicitados",
                              type: CoolAlertType.error,
                              confirmBtnColor: Colors.amber);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          onPrimary: Colors.white,
                          maximumSize: const Size(300, 60),
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      child: const Text('Ingresar a la reunión'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

InputDecoration decoracionInput() {
  return const InputDecoration(
      fillColor: Colors.white,
      filled: true,
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 4)),
      errorStyle: TextStyle(fontWeight: FontWeight.bold),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10))));
}

class Texto extends StatelessWidget {
  const Texto({
    Key? key,
    required this.texto,
    this.altura = 0,
  }) : super(key: key);

  final String texto;
  final double? altura;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: altura != 0
          ? EdgeInsets.only(left: 30, right: 30, top: altura!)
          : const EdgeInsets.only(left: 30, right: 30),
      child: Text(
        texto,
        style: estiloLetas(context),
      ),
    );
  }
}

TextStyle estiloLetas(BuildContext context) => TextStyle(
    color: Theme.of(context).primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    fontFamily: 'Inter');
