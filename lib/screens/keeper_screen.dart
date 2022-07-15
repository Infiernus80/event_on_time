import 'package:event_on_time/class/person_invite.dart';
import 'package:event_on_time/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class KeeperScreen extends StatelessWidget {
  static String route = "KeeperScreen";
  const KeeperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 70, top: 40),
                    child: ImagenShow(
                        width: 240,
                        height: 240,
                        alignment: Alignment.center,
                        routeImage: 'assets/images/logo.png'),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 58, right: 58),
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
                      if (barcodeScanRes != '-1') {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          backgroundColor:
                              const Color.fromRGBO(67, 125, 160, 1),
                          builder: (context) => SizedBox(
                            height: 500,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InfoPerson(
                                  qr: barcodeScanRes,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        onPrimary: Colors.white,
                        maximumSize: const Size(300, 60),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    child: const Text('ESCANEAR'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: ImagenShow(
                    width: 300,
                    height: 300,
                    alignment: Alignment.center,
                    routeImage: 'assets/images/qr.png'),
              )
            ],
          ),
        ],
      ),
    ));
  }
}

class InfoPerson extends StatelessWidget {
  const InfoPerson({
    Key? key,
    required this.qr,
  }) : super(key: key);
  final String qr;

  @override
  Widget build(BuildContext context) {
    Map<dynamic,dynamic> persona = PersonInvite().personas;
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
                    txtBase: '${persona['Nombre'][int.parse(qr)]}',
                    txtIdentificador: 'Nombre: ',
                  ),
                  TextoAMostrar(
                    txtBase: '${persona['Acompañantes'][int.parse(qr)]}',
                    txtIdentificador: 'Acompañantes: ',
                  ),
                  TextoAMostrar(
                    txtBase: '${persona['Correo'][int.parse(qr)]}',
                    txtIdentificador: 'Correo: ',
                  ),
                  
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 94, left: 50),
                        child: SizedBox(
                          width: 300,
                          height: 50,
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
          Text(
            txtIdentificador,
            style: styleText(),
          ),
          SizedBox(
            child: Text(
              txtBase,
              style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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