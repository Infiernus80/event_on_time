import 'package:event_on_time/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
                    onPressed: () {
                      showCupertinoModalBottomSheet(
                          expand: true,
                          context: context,
                          backgroundColor:
                              const Color.fromRGBO(67, 125, 160, 1),
                          builder: (context) => const InfoPerson());
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Card(
        color: const Color.fromRGBO(67, 125, 160, 1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 54, left: 23),
              child: Row(
                children: [
                  Text(
                    'Nombres:',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 30),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
