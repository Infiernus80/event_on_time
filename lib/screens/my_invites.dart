import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_on_time/widgets/custom_drawer.dart';
import 'package:event_on_time/widgets/custom_grap.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/auth_stadistic_user.dart';
import 'dart:math' as math;
// import 'package:responsive_sizer/responsive_sizer.dart';

class MyInvitesScreen extends StatelessWidget {
  static String route = 'MyInvitesScreen';
  const MyInvitesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStadisticUserProvider stadistic =
        Provider.of<AuthStadisticUserProvider>(context);
    List map = stadistic.mapaString;

    Color colores =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    // debugPrint('${map}');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(83, 111, 138, 1),
        title: const Text('Mis invitaciones',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // fit: StackFit.expand,
        child: Stack(
          children: [
            Column(
              children: [
                for (var row in map)
                  SizedBox(
                    width: 500,
                    height: 500,
                    child: Card(
                      elevation: 0.0,
                      // margin: EdgeInsets.only(
                      //     left: 32.w, right: 32.w, top: 20.w, bottom: 0.w),
                      color: Colors.white,
                      child: FlipCard(
                        fill: Fill.fillBack,
                        direction: FlipDirection.HORIZONTAL,
                        speed: 1000,
                        onFlipDone: (status) {
                          debugPrint('$status');
                        },
                        front: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(83, 111, 138, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70.w,
                                child: AutoSizeText(
                                  row['name'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                  maxLines: 2,
                                  // maxFontSize: 30,
                                  minFontSize: 20,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3.h),
                                width: 70.w,
                                child: AutoSizeText(
                                  row['status'] ? 'Pendiente' : 'Finalizado',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  // maxFontSize: 30,
                                  minFontSize: 15,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        back: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(83, 111, 138, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SfCircularChart(
                                title: ChartTitle(
                                    text: 'Actividad',
                                    textStyle:
                                        const TextStyle(color: Colors.white)),
                                legend: Legend(
                                    isVisible: true,
                                    textStyle:
                                        const TextStyle(color: Colors.white)),
                                series: <CircularSeries>[
                                  // Renders radial bar chart
                                  PieSeries<ChartData, String>(
                                      dataSource: [
                                        // Bind data source
                                        ChartData(
                                            'Confirmados',
                                            row['stadistics']
                                                ['amountConfirmation'],
                                            Colors.green),
                                        ChartData(
                                            'Por confirmar',
                                            row['stadistics']
                                                ['amountNoConfirmation'],
                                            Colors.amber),
                                      ],
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y,
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              isVisible: true,
                                              textStyle: TextStyle(
                                                  color: Colors.white))),
                                ],
                              )
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
      ),
      drawer: const CustomDrawer(),
    );
  }
}
