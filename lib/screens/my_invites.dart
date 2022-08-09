import 'package:event_on_time/widgets/custom_drawer.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

class MyInvitesScreen extends StatelessWidget {
  static String route = 'MyInvitesScreen';
  const MyInvitesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(83, 111, 138, 1),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        // fit: StackFit.expand,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 500,
                    height: 500,
                    child: Card(
                      elevation: 0.0,
                      // margin: EdgeInsets.only(
                      //     left: 32.w, right: 32.w, top: 20.w, bottom: 0.w),
                      color: const Color(0x00000000),
                      child: FlipCard(
                        fill: Fill.fillBack,
                        direction: FlipDirection.HORIZONTAL,
                        speed: 1000,
                        onFlipDone: (status) {
                          print(status);
                        },
                        front: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF006666),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Front',
                                  style: Theme.of(context).textTheme.headline1),
                              Text('Click here to flip back',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ),
                        back: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF006666),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(8.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Back',
                                  style: Theme.of(context).textTheme.headline1),
                              Text('Click here to flip front',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 500,
                    height: 500,
                    child: Card(
                      elevation: 0.0,
                      // margin: EdgeInsets.only(
                      //     left: 32.w, right: 32.w, top: 20.w, bottom: 0.w),
                      color: const Color(0x00000000),
                      child: FlipCard(
                        fill: Fill.fillBack,
                        direction: FlipDirection.HORIZONTAL,
                        speed: 1000,
                        onFlipDone: (status) {
                          print(status);
                        },
                        front: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF006666),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Front',
                                  style: Theme.of(context).textTheme.headline1),
                              Text('Click here to flip back',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ),
                        back: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF006666),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(8.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Back',
                                  style: Theme.of(context).textTheme.headline1),
                              Text('Click here to flip front',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
