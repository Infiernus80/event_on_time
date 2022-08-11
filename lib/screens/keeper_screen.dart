import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_on_time/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../providers/keeper_scan.dart';

class KeeperScreen extends StatelessWidget {
  static String route = "KeeperScreen";
  const KeeperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)!.settings.arguments) != null
        ? ModalRoute.of(context)!.settings.arguments as Map
        : {};
    KeeperGetProvider keeper = KeeperGetProvider();
    BuildContext dialogContext = context;
    debugPrint('$args');
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      // color: Colors.amber,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                      child: ImagenShow(
                        width: 80.w,
                        height: 80.w,
                        alignment: Alignment.center,
                        routeImage: 'assets/images/Logo.png',
                      ),
                    )
                  ],
                ),
                Container(
                  // color: Colors.amberAccent,
                  margin: EdgeInsets.symmetric(vertical: 10.w),
                  width: 80.w,
                  child: SizedBox(
                    width: 244,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        String barcodeScanRes =
                            await FlutterBarcodeScanner.scanBarcode(
                          '#F6B33E',
                          'Cancelar',
                          false,
                          ScanMode.QR,
                        );
                        // print(barcodeScanRes);

                        if (barcodeScanRes != '') {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              dialogContext = context;
                              return Dialog(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    LottieBuilder.asset('assets/images/QRload.json',width: 100,),
                                    const Text("Por favor espere..."),
                                  ],
                                ),
                              );
                            },
                          );
                          keeper.datosInvitado(
                              barcodeScanRes, args['guest']['token']);

                          Future.delayed(const Duration(seconds: 3), () {
                            if (keeper.isData) {
                              Navigator.pop(dialogContext);
                              Map map = keeper.mapaString();
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                                backgroundColor:
                                    const Color.fromRGBO(67, 125, 160, 1),
                                builder: (context) => SizedBox(
                                  height: 75.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InfoPerson(
                                        qr: map,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              debugPrint('No funciona este codigo');
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          onPrimary: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      child: const Text('ESCANEAR'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.w),
                  child: const ImagenShow(
                      width: 300,
                      height: 300,
                      alignment: Alignment.center,
                      routeImage: 'assets/images/qr.png'),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class InfoPerson extends StatelessWidget {
  const InfoPerson({
    Key? key,
    required this.qr,
  }) : super(key: key);
  final Map qr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 54, horizontal: 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextoAMostrar(
                    txtBase: '${qr['name']}',
                    txtIdentificador: 'Nombre: ',
                  ),
                  TextoAMostrar(
                    txtBase: '${qr['numberPartner'].toString()}',
                    txtIdentificador: 'Acompañantes: ',
                  ),
                  TextoAMostrar(
                    txtBase: '${qr['email']}',
                    txtIdentificador: 'Correo: ',
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90.w,
                        height: 50,
                        margin: EdgeInsets.only(top: 10.w),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: styleForText(),
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle styleForText() {
    return ElevatedButton.styleFrom(
        primary: Colors.amber,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
}

class TextoAMostrar extends StatelessWidget {
  const TextoAMostrar({
    Key? key,
    required this.txtBase,
    required this.txtIdentificador,
  }) : super(key: key);

  final String txtBase, txtIdentificador;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            txtIdentificador,
            style: styleText(),
          ),
          SizedBox(
            child: AutoSizeText(
              txtBase,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  TextStyle styleText() => const TextStyle(
      color: Color.fromRGBO(228, 161, 147, 1),
      fontSize: 20,
      fontWeight: FontWeight.bold);
}
