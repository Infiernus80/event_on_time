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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: const [
                ImagenShow(
                    width: 200,
                    height: 150,
                    alignment: Alignment.topLeft,
                    routeImage: 'assets/images/cordon.png'),
                Padding(
                  padding: EdgeInsets.only(left: 50,top: 30),
                  child: ImagenShow(
                      width: 240,
                      height: 240,
                      alignment: Alignment.centerRight,
                      routeImage: 'assets/images/logo.png'),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
