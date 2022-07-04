
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

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