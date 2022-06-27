import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class TextWeb extends StatelessWidget {
  const TextWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 89, right: 89),
            child: Text(
              '¿No tienes ningún código?',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 90, right: 90),
            child: Text(
                'Crea tu reunión en minutos \n conoce nuestro sitio web',
                style: TextStyle(color: Colors.white, fontSize: 15),
                maxLines: 2),
          ),
          BottonHexagon(),
          
        ],
      ),
    ]);
  }

  TextStyle estiloLetas(BuildContext context, String letras) => const TextStyle(
        color: Colors.white,
        fontSize: 15,
      );
}

class BottonHexagon extends StatelessWidget {
  const BottonHexagon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 60,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.amber,
              onPrimary: Colors.white,
              shape: const PolygonBorder(
                sides: 6,
                borderRadius: 5.0, // Default 0.0 degrees
                // Default 0.0 degrees
              ),
            ),
            onPressed: () {},
            child: const Icon(Icons.arrow_forward_ios_outlined)),
      ),
    );
  }
}
