import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_on_time/screens/login_screen.dart';
import 'package:event_on_time/screens/screens.dart';
import 'package:event_on_time/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../providers/custom_dropdown.dart';

class InviteScreen extends StatelessWidget {
  static String route = "InviteScreen";
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomDropdown confirmation = Provider.of<CustomDropdown>(context);
    final args = (ModalRoute.of(context)!.settings.arguments) != null
        ? ModalRoute.of(context)!.settings.arguments as Map
        : {};
    List imagenes = args['pictures'];
    List comida = args['services'];

    // debugPrint('$args');
    // debugPrint('$');
    debugPrint('${args['services']}');
    // debugPrint('${args['pictures']}');
    // debugPrint('${args['guest']}');
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  //Imagen Principal
                  StackPrincipal(args: args),
                  //Div donde se encuentra la fecha
                  StackNF(args: args),
                  //Div de la descripcion del evento
                  StackDescription(args: args),
                  //Divisor para la ubicacion
                  const StackImagenDivisora(
                    img: 'assets/images/Locate.json',
                    repet: true,
                  ),
                  //Contenedor para la ubicacion
                  StackCategorias(
                    txt1: (args['address'] != '')
                        ? 'Ubicación: ${args['address']}'
                        : '',
                    // txt2: (args['dressCode'] != '') ? args['dressCode']: '',
                    fn: () async {
                      String url = args['googleMaps'];
                      if (await canLaunchUrlString(url)) {
                        await launchUrlString(url);
                      } else {
                        debugPrint('No se pudo abrir $url');
                      }
                    },
                    boton: true,
                  ),

                  //Divisor para la comida
                  const StackImagenDivisora(
                    img: 'assets/images/food.json',
                  ),

                  //Contenedor para la comida (Crear un for donde se muestren todos los servicios de comida que se manden de la base de datos)
                  StackComida(comida: comida),

                  //Div para el codigo de vestimenta
                  const StackImagenDivisoraNormal(
                      img: 'assets/images/dresscode.png'),

                  //Contenedor del texto para el codigo de vestimenta
                  StackCategorias(
                      txt1: 'Tipo de ropa: ${args['dressCode']}', fn: () {}),

                  (imagenes.isEmpty)
                      ? Container()
                      : const StackImagenDivisora(
                          img: 'assets/images/photo2.json', repet: false),

                  //Muestra de carrusel
                  StackCarrusel(imagenes: imagenes),

                  //Div para la confirmacion
                  StackImagenDivisora(
                      img: (confirmation.map['result']['confirmation'])
                          ? 'assets/images/decline.json'
                          : 'assets/images/confirm.json'),
                  //Muestra del boton para confirmar
                  StackConfirmation(confirmation: confirmation, args: args),

                  //Muestra de codigo qr
                  const StackImagenDivisora(img: 'assets/images/QR2.json'),
                  StackQR(args: args),

                  const BtnRegresar()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StackComida extends StatelessWidget {
  const StackComida({
    Key? key,
    required this.comida,
  }) : super(key: key);

  final List comida;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 3.h),
          child: Column(children: [
            for(var row in comida ) Text(row['name'],style: estiloTexto(20),),
          ],),
        ),
      ],
    );
  }
}

class StackCarrusel extends StatelessWidget {
  const StackCarrusel({
    Key? key,
    required this.imagenes,
  }) : super(key: key);

  final List imagenes;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            (imagenes.isEmpty)
                ? Container()
                : CarouselSlider(
                    items: imagenes
                        .map((e) => Container(
                              margin: EdgeInsets.only(bottom: 2.h),
                              child: Center(
                                child: Image.network(e['url']),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(),
                  )
          ],
        )
      ],
    );
  }
}

class BtnRegresar extends StatelessWidget {
  const BtnRegresar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 5.h,
      margin: EdgeInsets.only(bottom: 4.h),
      child: ElevatedButton(
        // style: styleForText(),
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ), (route) => false);
        },
        child: const Text('Regresar'),
      ),
    );
  }
}

class StackConfirmation extends StatelessWidget {
  const StackConfirmation({
    Key? key,
    required this.confirmation,
    required this.args,
  }) : super(key: key);

  final CustomDropdown confirmation;
  final Map args;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Center(
              child: Container(
                // color: Colors.amber,
                margin: EdgeInsets.only(bottom: 3.h),
                width: 200,
                child: Center(
                    child: ElevatedButton(
                      // style: styleForText(),
                  child: (confirmation.map['result']['confirmation'])
                      ? const Text('Rechazar invitación')
                      : const Text('Confirmar asistencia'),
                  onPressed: () {
                    debugPrint(
                        'Antes de enviar ${confirmation.map['result']['confirmation']}');
                    confirmation.confirmarRechazar(args['guest']['token']);
                    Future.delayed(const Duration(seconds: 2), () {
                      debugPrint(
                          'Despues de enviar ${confirmation.map['result']['confirmation']}');
                    });
                  },
                )),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class StackQR extends StatelessWidget {
  const StackQR({
    Key? key,
    required this.args,
  }) : super(key: key);

  final Map args;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              // color: Color.fromARGB(255, 255, 193, 7),
              // width: 200,
              // height: 200,
              margin: EdgeInsets.only(bottom: 10.w),
              child: QrImage(
                data: args['guest']['_id'],
                size: 70.w,
                backgroundColor: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}

class StackCategorias extends StatelessWidget {
  const StackCategorias({
    Key? key,
    // required this.args,
    required this.txt1,
    this.txt2 = '',
    required this.fn,
    this.boton,
  }) : super(key: key);

  // final Map args;
  final String txt1;
  final String? txt2;
  final Function fn;
  final bool? boton;

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
              margin: EdgeInsets.only(top: 1.w,bottom: 3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 90.w,
                    // color: Colors.red,
                    child: (txt1 != '')
                        ? AutoSizeText(
                            txt1,
                            style: estiloTexto(20),
                            textAlign: TextAlign.center,
                            maxLines: 5,
                          )
                        : Container(),
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
                    width: 90.w,
                    child: (txt2 != '')
                        ? AutoSizeText(
                            txt2!,
                            style: estiloTexto(20),
                            textAlign: TextAlign.center,
                            maxLines: 5,
                          )
                        : Container(),
                  ),
                ],
              ),
            ),

            //CONTENEDOR PARA BOTON
            (boton == true)
                ? Container(
                    // color: Colors.black,
                    margin: EdgeInsets.only(bottom: 3.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BottonHexagon(
                          funtion: fn,
                        ),
                      ],
                    ),
                  )
                : Container(),
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
    this.repet,
  }) : super(key: key);
  final String img;
  final bool? repet;
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
                repeat: repet,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: const Divider(color: Colors.white,thickness: 5),
        ),
      ],
    );
  }
}

class StackImagenDivisoraNormal extends StatelessWidget {
  const StackImagenDivisoraNormal({
    Key? key,
    required this.img,
    this.repet,
  }) : super(key: key);
  final String img;
  final bool? repet;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // color: Colors.amber,
          margin: EdgeInsets.only(top: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: const Divider(color: Colors.white,thickness: 5),
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
                      : const CircularProgressIndicator(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.w, left: 10),
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
                  width: 150, height: 150, repeat: false),
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
                        : const CircularProgressIndicator(),
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
                        : const CircularProgressIndicator(),
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
                        : const CircularProgressIndicator(),
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
    debugPrint(args['services'].runtimeType.toString());
    return Stack(
      children: [
        Row(
          children: [
            Container(
              width: 100.w,
              child: (args['type'] == 'Personal')
                  ? Image.asset(
                      'assets/images/Invite1.png',
                      width: 100.w,
                    )
                  : (args['type'] == 'Boda')
                      ? Image.asset('assets/images/Invite2.png')
                      : (args['type'] == 'Laboral')
                          ? Image.asset('assets/images/Invite3.png')
                          : Container(),
            )
          ],
        ),
        Container(
          // color: Colors.red,
          width: 100.w,
          margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 22.h),
          child: (args['name'] != '')
              ? Center(
                  child: AutoSizeText(
                  args['name'],
                  style: estiloTexto(30),
                  minFontSize: 12,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ))
              : const CircularProgressIndicator(),
        )
      ],
    );
  }
}

TextStyle estiloTexto(double size) {
  return TextStyle(
      color: Colors.white, fontSize: size, fontWeight: FontWeight.bold);
}

ButtonStyle styleForText() {
    return ElevatedButton.styleFrom(
        primary: Colors.amber,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }