import 'package:event_on_time/widgets/widgets.dart';
import 'package:flutter/material.dart';


class TextWeb extends StatelessWidget {
  const TextWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children:  [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 89, right: 89),
            child: Text(
              '¿No tienes ningún código?',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          const Padding(
            padding:  EdgeInsets.only(top: 10, left: 90, right: 90),
            child: Text(
                'Crea tu reunión en minutos \n conoce nuestro sitio web',
                style: TextStyle(color: Colors.white, fontSize: 15),
                maxLines: 2),
          ),
          BottonHexagon(funtion: (){},),
        ],
      ),
    ]);
  }

  TextStyle estiloLetas(BuildContext context, String letras) => const TextStyle(
        color: Colors.white,
        fontSize: 15,
      );
}

