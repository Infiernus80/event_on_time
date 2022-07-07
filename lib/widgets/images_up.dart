import 'package:animate_do/animate_do.dart';
import 'package:event_on_time/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ImagesUp extends StatelessWidget {
  const ImagesUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(left: 50,top: 50),
                  child: BounceInDown(
                    duration: Duration(milliseconds: 2000),
                    child: const ImagenShow(
                        width: 240,
                        height: 240,
                        alignment: Alignment.centerRight,
                        routeImage: 'assets/images/logo.png'),
                  ),
                ),
                
                const ImagenShow(
                    width: 200,
                    height: 150,
                    alignment: Alignment.topLeft,
                    routeImage: 'assets/images/cordon.png'),
              ],
            ),
          ],
        )
      ],
    );
  }
}
