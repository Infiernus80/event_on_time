import 'package:event_on_time/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String route = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children:[
            Column(
              children: [
                Row(
                  children: const[
                    ImagesUp(),
                  ],
                ),
                Row(
                  children: const[
                    FormHome()
                  ],
                ),
                const Divisora(),
                Row(
                  children: const[
                    TextWeb()
                  ],
                ),
              ],
            ),
          ],
        ),
      )
    );
  }


}

class Divisora extends StatelessWidget {
  const Divisora({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40 ),
      child: SizedBox(
        width: 323,
        child: Divider(
          color: Colors.white,
        ),
      ),
    );
  }
}
