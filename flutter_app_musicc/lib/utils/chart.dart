import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_musicc/interfaces/drawer.dart';
import 'package:flutter_app_musicc/utils/getState.dart';
import 'package:get/get.dart';

class Chart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChartState();
}

class ChartState extends State<Chart> {
  GetState getState = Get.put(GetState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İstatistikler"),
      ),
      drawer: DrawerPage(),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: const Color(0xff2c4260),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Şarkı türlerine göre favorilerinizde bulunan şarkı sayıları",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 20,
                          barTouchData: BarTouchData(
                            enabled: false,
                            touchTooltipData: BarTouchTooltipData(
                              tooltipBgColor: Colors.transparent,
                              tooltipPadding: const EdgeInsets.all(0),
                              tooltipMargin: 8,
                              getTooltipItem: (
                                  BarChartGroupData group,
                                  int groupIndex,
                                  BarChartRodData rod,
                                  int rodIndex,
                                  ) {
                                return BarTooltipItem(
                                  rod.y.round().toString(),
                                  TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(
                                  color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                              margin: 40,
                              getTitles: (double value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'Rock';
                                  case 1:
                                    return 'Metal';
                                  case 2:
                                    return 'Türkçe Pop';
                                  case 3:
                                    return 'Rap';
                                  default:
                                    return '';
                                }
                              },
                            ),
                            leftTitles: SideTitles(showTitles: false),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barRods: [
                                BarChartRodData(y: getState.favstatistics[0].length.toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                              ],
                              showingTooltipIndicators: [0],
                            ),
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(y: getState.favstatistics[1].length.toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                              ],
                              showingTooltipIndicators: [0],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(y: getState.favstatistics[2].length.toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                              ],
                              showingTooltipIndicators: [0],
                            ),
                            BarChartGroupData(
                              x: 3,
                              barRods: [
                                BarChartRodData(y: getState.favstatistics[3].length.toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                              ],
                              showingTooltipIndicators: [0],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}