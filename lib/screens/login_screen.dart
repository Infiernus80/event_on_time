import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/inputs_providers.dart';
import '../providers/switch_provider.dart';

class LoginScreen extends StatelessWidget {
  static String route = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SwitchProvider switchP = Provider.of<SwitchProvider>(context);
    InputProvider inputs = Provider.of<InputProvider>(context);
    // AuthEventProvider auth = Provider.of<AuthEventProvider>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      //Contenedor para la imagen superiro izquierda
                      Positioned(
                        // left: 0,
                        width: 200,
                        height: 150,
                        child: BounceInDown(
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/cordon.png'))),
                          ),
                        ),
                      ),

                      //Contenedor para ellogo
                      Positioned(
                        right: 95,
                        top: 50,
                        width: 200,
                        height: 250,
                        child: BounceInDown(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                              ),
                            ),
                            // margin: const EdgeInsets.only(top: 50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      BounceInDown(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(83, 111, 138, .9),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade100))),
                                child: TextField(
                                  controller: inputs.campo1,
                                  keyboardType: (switchP.isInvitateGet == false)
                                      ? TextInputType.number
                                      : TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      label: (switchP.isInvitateGet == false)
                                          ? Txt(
                                              txt: 'Código de reunión',
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 16)
                                          : Txt(
                                              txt: 'Correo electronico',
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 16),
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),

                              //Contenedor Codigo de usuario y contraseña
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: inputs.campo2,
                                  keyboardType: (switchP.isInvitateGet == false)
                                      ? TextInputType.number
                                      : TextInputType.text,
                                  obscureText: switchP.isInvitateGet,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      label: (switchP.isInvitateGet == false)
                                          ? Txt(
                                              txt: 'Código de usuario',
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 16)
                                          : Txt(
                                              txt: 'Contraseña',
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 16),
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      BounceInDown(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Invitado',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                activeColor: Colors.amber,
                                onChanged: (value) {
                                  switchP.isInvitateSet();
                                  inputs.campo1.clear();
                                  inputs.campo2.clear();
                                  debugPrint('${switchP.isInvitateGet}');
                                  // debugPrint('$value');
                                },
                                value: switchP.isInvitateGet,
                              ),
                              const Text(
                                'Organizador',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      BounceInDown(
                        child: Container(
                          height: 50,
                          decoration: decoration(),
                          child: Center(
                            child: SizedBox(
                              width: 500,
                              height: 50,
                              child: TextButton(
                                style: const ButtonStyle(
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                onPressed: () {
                                  // auth.validar();
                                  // Map<String,dynamic> map = auth.mapaString();
                                  // debugPrint('${map['name']}');
                                  inputs.validations(
                                      context, switchP.isInvitateGet);
                                },
                                child: (switchP.isInvitateGet == false)
                                    ? const Txt(
                                        txt: 'Ingresar',
                                        color: Colors.white,
                                        size: 17,
                                      )
                                    : const Txt(
                                        txt: 'Iniciar sesión',
                                        color: Colors.white,
                                        size: 17,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(255, 193, 7, 1),
          // Color.fromRGBO(228, 161, 147, 1),
          Color.fromRGBO(255, 193, 7, .6),
        ]));
  }
}

class Txt extends StatelessWidget {
  const Txt({
    Key? key,
    required this.txt,
    required this.color,
    required this.size,
  }) : super(key: key);

  final String txt;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style:
          TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: size),
    );
  }
}
