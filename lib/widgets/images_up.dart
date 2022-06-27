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
                Image(
                  image: AssetImage('assets/images/cordon.png'),
                  width: 190,
                  height: 200,
                  alignment: Alignment.topLeft,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Image(
                      image: AssetImage('assets/images/Logo.png'),
                      width: 300,
                      height: 300,
                      alignment: Alignment.centerRight),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
