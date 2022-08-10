import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_on_time/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
// import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InviteScreen extends StatelessWidget {
  static String route = "InviteScreen";
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final arg = Provider.of<ScreenArguments>(context);
    final args = (ModalRoute.of(context)!.settings.arguments) != null
        ? ModalRoute.of(context)!.settings.arguments as Map
        : {};
    debugPrint('$args');

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  StackPrincipal(args: args),
                  StackNF(args: args),
                  StackDescription(args: args),
                  //Divisor para la ubicacion
                  const StackImagenDivisora(
                    img: 'assets/images/Locate.json',
                  ),
                  //Contenedor para la ubicacion
                  StackCategorias(
                    txt1: (args['address'] != '') ? args['address'] : '',
                    txt2: (args['dressCode'] != '') ? args['dressCode']: '',
                  ),
                  //Divisor para la comida
                  const StackImagenDivisora(
                    img: 'assets/images/food.json',
                  ),
                  //Contenedor para la comida (Crear un for donde se muestren todos los servicios de comida que se manden de la base de datos)
                  StackCategorias(
                    txt1: (args['services'][0]['name'] != '') ? args['services'][0]['name']: '',
                    txt2: (args['services'][0]['description'] != '') ?args['services'][0]['description']: '',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StackCategorias extends StatelessWidget {
  const StackCategorias({
    Key? key,
    // required this.args,
    required this.txt1,
    required this.txt2,
  }) : super(key: key);

  // final Map args;
  final String txt1, txt2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            //CONTENEDOR PARA LA DIRECCION
            Container(
              // width: 30.w,
              // height: 20.w,
              // color: Colors.black,
              margin: EdgeInsets.only(top: 3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90.w,
                    // color: Colors.red,
                    child: (txt1 != '')
                        ? AutoSizeText(
                            txt1,
                            style: estiloTexto(20),
                            textAlign: TextAlign.justify,
                            maxLines: 5,
                          )
                        : const CircularProgressIndicator(),
                  ),
                ],
              ),
            ),

            //CONTAINER PARA EL CODIGO POSTAL
            Container(
              // color: Colors.black,
              // margin: EdgeInsets.only(top: 1.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.red,
                    child: (txt2 != '')
                        ? Text(
                            txt2,
                            style: estiloTexto(20),
                          )
                        : CircularProgressIndicator(),
                  ),
                ],
              ),
            ),

            //CONTENEDOR PARA BOTON
            Container(
              // color: Colors.black,
              // margin: EdgeInsets.only(top: 1.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: const BottonHexagon()),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StackImagenDivisora extends StatelessWidget {
  const StackImagenDivisora({
    Key? key,
    required this.img,
  }) : super(key: key);
  final String img;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // color: Colors.amber,
          margin: EdgeInsets.only(top: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                img,
                width: 150,
                height: 150,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class StackDescription extends StatelessWidget {
  const StackDescription({
    Key? key,
    required this.args,
  }) : super(key: key);

  final Map args;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // color: Colors.amber,
          margin: EdgeInsets.only(top: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                margin: EdgeInsets.only(left: 5.w),
                // color: Colors.red,
                child: Center(
                  child: (args != null)
                      ? AutoSizeText(
                          args['description'],
                          style: estiloTexto(20),
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                        )
                      : CircularProgressIndicator(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.w,left: 10),
                // color: Colors.blue,
                child: Lottie.asset(
                  'assets/images/Description.json',
                  width: 150,
                  height: 150,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class StackNF extends StatelessWidget {
  const StackNF({
    Key? key,
    required this.args,
  }) : super(key: key);

  final Map args;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              // color: Colors.blue,
              margin: EdgeInsets.only(top: 5.w, left: 2.w),
              child: Lottie.asset('assets/images/Fiesta.json',
                  width: 150, height: 150),
            ),
            Center(
              child: Column(
                children: [
                  //Contenedor del nombre de la persona
                  Container(
                    // width: 100,
                    margin: EdgeInsets.only(left: 2.w),
                    // color: Colors.blueGrey,
                    child: (args['name'] != '')
                        ? Text(
                            args['name'],
                            style: estiloTexto(20),
                          )
                        : CircularProgressIndicator(),
                  ),
                  //Container de la fecha format( dd mm)
                  Container(
                    // width: 100,
                    margin: EdgeInsets.only(top: 2.w),
                    // color: Colors.blueGrey,
                    child: (args['dateStart'] != '')
                        ? Text(
                            DateFormat.MMMMd('en_US').format(
                              DateTime.parse(args['dateStart']),
                            ),
                            style: estiloTexto(20),
                          )
                        : CircularProgressIndicator(),
                  ),
                  Container(
                    // width: 100,
                    margin: EdgeInsets.only(top: 2.w),
                    // color: Colors.blueGrey,
                    child: (args['dateStart'] != '')
                        ? Text(
                            DateFormat.y('en_US').format(
                              DateTime.parse(args['dateStart']),
                            ),
                            style: estiloTexto(20),
                          )
                        : CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StackPrincipal extends StatelessWidget {
  const StackPrincipal({
    Key? key,
    required this.args,
  }) : super(key: key);

  final Map args;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              width: Adaptive.w(100),
              // color: Colors.amber,
              child: const ImagenShow(
                  width: 392,
                  height: 400,
                  alignment: Alignment.center,
                  routeImage: 'assets/images/Invite1.png'),
            )
          ],
        ),
        Container(
          // color: Colors.red,
          width: 300,
          margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 40.w),
          child: (args['name'] != '')
          ? Center(
              child: AutoSizeText(
            args['name'],
            style: estiloTexto(30),
            minFontSize: 16,
            maxLines: 2,
          ))
          : CircularProgressIndicator(),
        )
      ],
    );
  }
}

TextStyle estiloTexto(double size) {
  return TextStyle(
      color: Colors.white, fontSize: size, fontWeight: FontWeight.bold);
}
