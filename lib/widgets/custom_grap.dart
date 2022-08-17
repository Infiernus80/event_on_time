import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graficas extends StatelessWidget {
  const Graficas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: 'Actividad'),
      legend: Legend(isVisible: true),
      
      series: <CircularSeries>[
        // Renders radial bar chart
        PieSeries<ChartData, String>(
          dataSource: [
            // Bind data source
            ChartData('Junio', 60, Colors.green),
            ChartData('Febrero', 28, Colors.amber),
            ChartData('Marzo', 34, Colors.blue),
            ChartData('Abril', 32, Colors.amber),
            ChartData('Mayo', 40, Colors.red)
          ],
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          dataLabelSettings:const DataLabelSettings(isVisible : true)
        ),
      ],
      
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final int y;
  final Color color;
}