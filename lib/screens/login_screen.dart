import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/switch_provider.dart';

class LoginScreen extends StatelessWidget {
  static String route = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SwitchProvider switchP = Provider.of<SwitchProvider>(context);
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
                      Positioned(
                        // left: 0,
                        width: 200,
                        height: 150,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/cordon.png'))),
                        ),
                      ),
                      // Positioned(
                      //   left: 140,
                      //   width: 80,
                      //   height: 150,
                      //   child: Container(
                      //     decoration: const BoxDecoration(
                      //         image: DecorationImage(
                      //             image:
                      //                 AssetImage('assets/images/light-2.png'))),
                      //   ),
                      // ),
                      // Positioned(
                      //   right: 10,
                      //   top: 20,
                      //   width: 150,
                      //   height: 150,
                      //   child: Container(
                      //     decoration: const BoxDecoration(
                      //       image: DecorationImage(
                      //         image: AssetImage('assets/images/Conos.png'),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Positioned(
                        right: 95,
                        top: 50,
                        width: 200,
                        height: 250,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                          ),
                          // margin: const EdgeInsets.only(top: 50),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
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
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // hintText: "Código de reunión",
                                    label: Text(
                                      "Código de reunión",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    label: Text("Código de usuario",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    // hintText: "Código de usuario",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
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
                                debugPrint(value.toString());
                                debugPrint('Provider: ${switchP.isNotifiable.toString()}');
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
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(255, 193, 7, 1),
                              // Color.fromRGBO(228, 161, 147, 1),
                              Color.fromRGBO(255, 193, 7, .6),
                            ])),
                        child: Center(
                          child: SizedBox(
                            width: 500,
                            height: 50,
                            child: TextButton(
                              style: const ButtonStyle(
                                splashFactory: NoSplash.splashFactory,
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Iniciar sesión",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      // const Text(
                      //   "Forgot Password?",
                      //   style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
