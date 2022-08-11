import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_on_time/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"),value: "USA"),
    DropdownMenuItem(child: Text("Canada"),value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    DropdownMenuItem(child: Text("England"),value: "England"),
  ];
    return Scaffold(
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
                  StackCategorias(
                    txt1: (args['services'][0]['name'] != '')
                        ? args['services'][0]['name']
                        : '',
                    txt2: (args['services'][0]['description'] != '')
                        ? args['services'][0]['description']
                        : '',
                    fn: () {},
                  ),

                  //Div para el codigo de vestimenta
                  const StackImagenDivisoraNormal(
                      img: 'assets/images/dresscode.png'),

                  //Contenedor del texto para el codigo de vestimenta
                  StackCategorias(
                      txt1: 'Tipo de ropa: ${args['dressCode']}', fn: () {}),
                  //Div para el codigo de vestimenta
                  const StackImagenDivisora(img: 'assets/images/confirm.json'),

                  Stack(
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Container(
                              // color: Colors.amber,
                              width: 200,
                              child: Center(
                                child: DropdownButton(
                                  value: 'USA',
                                  items: menuItems,
                                  onChanged: (value){},
                                ),
                              ) ,
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  //Muestra de codigo qr
                  const StackImagenDivisora(img: 'assets/images/QR.json'),
                  StackQR(args: args)
                ],
              )
            ],
          ),
        ),
      ),
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
              margin: EdgeInsets.only(top: 3.w),
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
                    // margin: EdgeInsets.only(top: 1.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: BottonHexagon(
                            funtion: fn,
                          ),
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
                width: 150,
                height: 150,
              ),
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
          // width: 90.w,
          margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 45.w),
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
