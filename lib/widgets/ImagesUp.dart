import 'package:flutter/material.dart';

class ImagesUp extends StatelessWidget {
  const ImagesUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('assets/Logo.png'),width: 123,height: 103,alignment:Alignment.topLeft,),
              Image(image: AssetImage('assets/Logo.png'),width: 240,height: 240,alignment:Alignment.topRight,),
            ],
          )
        ],
      ),
    );
  }
}