import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_on_time/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/auth_stadistic_user.dart';
import '../providers/auth_user_provider.dart';
import '../widgets/custom_grap.dart';

class OrganizerScreen extends StatelessWidget {
  static String route = 'OrganizerScreen';
  const OrganizerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthUserProvider user = Provider.of<AuthUserProvider>(context);
    AuthStadisticUserProvider stadistic =
        Provider.of<AuthStadisticUserProvider>(context);
    List map = stadistic.mapaString;
    int personal = 0;
    int familiar = 0;
    int escolar = 0;
    int laboral = 0;

    for (var i in map) {
      if (i['type'] == 'Personal') {
        personal++;
      }
      if (i['type'] == 'Familiar') {
        familiar++;
      }
      if (i['type'] == 'Escolar') {
        escolar++;
      }
      if (i['type'] == 'Laboral') {
        laboral++;
      }
    }

    debugPrint(
        'Personal: $personal Familiar: $familiar Escolar: $escolar Laboral: $laboral');

    // debugPrint('${user.mapaString()}');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(83, 111, 138, 1),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 90.w,
              child: Lottie.asset('assets/images/welcom.json', repeat: false),
            ),
          ),
          const AutoSizeText(
            'BIENVENIDO',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
          SfCircularChart(
            title: ChartTitle(text: 'Tipos de eventos creados',textStyle: const TextStyle(fontWeight: FontWeight.bold)),
            legend: Legend(isVisible: true),
            series: <CircularSeries>[
              // Renders radial bar chart
              PieSeries<ChartData, String>(
                  dataSource: [
                    // Bind data source
                    ChartData('Personal', personal, Colors.green),
                    ChartData('Familiar', familiar, Colors.amber),
                    // ChartData('Escolar', escolar.toDouble(), Colors.blue),
                    ChartData('Laboral', laboral, Colors.amber),
                  ],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(color: Colors.white))),
            ],
          )
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
