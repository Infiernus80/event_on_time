import 'package:event_on_time/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../class/invite_screen_class.dart';

class InviteScreen extends StatelessWidget {
  static String route = "InviteScreen";
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = Provider.of<ScreenArguments>(context);
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    // Map<String,dynamic> map = args;
    debugPrint('$args');
    // 
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Images(arg: arg),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          NewText(
                            text: args['name'],
                            // text: 'hola',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          NewText(
                            text: DateFormat.MMMMd().format(DateTime.parse(args['dateStart'])),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const NewText(
                            text: '2022',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const NewText(
                            text: 'LOREM',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            top: 60,
                          ),
                          const NewText(
                            text: 'lorem',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            top: 16,
                          ),
                          const NewText(
                            text: 'lorem',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const Divisor(),
                          const NewText(
                            text: 'lorem',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const NewText(
                            text: 'lorem',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const BottonHexagon(),
                          const Divisor(),
                          const NewText(
                            text: 'lorem',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const NewText(
                            text: 'lorem',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const BottonHexagon(),
                          const Divisor(),
                          const NewText(
                            text: 'lorem',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const NewText(
                            text: 'lorem',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const Divisor(
                            top: 115,
                          ),
                          const ImagenShow(
                              width: 280,
                              height: 187,
                              alignment: Alignment.center,
                              routeImage: 'assets/images/image3.png'),
                          const Divisor(
                            
                          ),
                          // Aqui se crea el codigo qr desde el back end
                          QrImage(
                            data: '2',
                            version: QrVersions.auto,
                            size: 300,
                            foregroundColor:Theme.of(context).primaryColor,
                            // backgroundColor: Colors.white,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 110, top: 180),
                child: Text(
                  'LOREM',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Widget para agregar texto
class NewText extends StatelessWidget {
  const NewText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    this.top = 13,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top != 0 ? top! : 13),
      child: Text(
        text,
        style:
            TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      ),
    );
  }
}

// Widgets para el cambio de imagenes
class Images extends StatelessWidget {
  const Images({
    Key? key,
    required this.arg,
  }) : super(key: key);

  final ScreenArguments arg;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (arg.numeroInviteGet == 1)
            ? const ImagenShow(
                width: 360,
                height: 421,
                alignment: Alignment.center,
                routeImage: 'assets/images/Invite1.png')
            : (arg.numeroInviteGet == 2)
                ? const ImagenShow(
                    width: 360,
                    height: 421,
                    alignment: Alignment.center,
                    routeImage: 'assets/images/Invite2.png')
                : (arg.numeroInviteGet == 3)
                    ? const ImagenShow(
                        width: 360,
                        height: 421,
                        alignment: Alignment.center,
                        routeImage: 'assets/images/Invite3.png')
                    : const CircularProgressIndicator()
      ],
    );
  }
}

//Widget para dividir los campos
class Divisor extends StatelessWidget {
  const Divisor({
    Key? key,
    this.top = 0,
  }) : super(key: key);
  final double? top;

  @override
  Widget build(BuildContext context) {
    return const ImagenShow(
        width: 300,
        height: 300,
        alignment: Alignment.center,
        routeImage: 'assets/images/6.png');
  }
}
