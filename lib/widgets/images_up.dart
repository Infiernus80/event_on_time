import 'package:animate_do/animate_do.dart';
import 'package:event_on_time/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
                  padding: EdgeInsets.only(left: 12.h, top: 6.h),
                  child: BounceInDown(
                    duration: const Duration(milliseconds: 2000),
                    child: ImagenShow(
                        width: Adaptive.w(50),
                        height: 30.h,
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
