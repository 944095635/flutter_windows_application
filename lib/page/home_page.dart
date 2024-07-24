import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_styled/padding_extension.dart';
import 'package:flutter_styled/radius_extension.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:flutter_windows_application/model/chart_sample_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("images/bg.webp"),
          Column(
            children: [
              paddingHV(
                80,
                30,
                child: Row(
                  children: [
                    const Spacer(),
                    buildUserCard(),
                    10.horizontalSpace,
                    const Text(
                      "Dream Machine",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "ITCAvantGarde",
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //内容区域
              Wrap(
                runSpacing: 20,
                children: [
                  buildChart(),
                  40.horizontalSpace,
                  buildChart1(),
                  40.horizontalSpace,
                  buildChart2(),
                  40.horizontalSpace,
                  buildCard(
                    msg: "2000.00\$",
                    button: "Total",
                    color: const Color(0xFFECF1FF),
                  ),
                  40.horizontalSpace,
                  buildCard(
                    msg: "400\$",
                    button: "See",
                    color: const Color(0xFFfff6f2),
                  ),
                  40.horizontalSpace,
                  buildCard(
                    msg: "87\$",
                    button: "What?",
                    color: const Color(0xFFf1ecfe),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildUserCard() {
    return const CircleAvatar(
      foregroundImage: NetworkImage(
        "https://cdn2.zzzmh.cn/wallpaper/origin/21f43426bfbf47218e2617b6cb912591.png?response-content-disposition=attachment&auth_key=1722787200-96fdda953be3283a1167f7ef127b6e4ed6401fed-0-2fc52b63ea677c0c09bae1dece808ea6",
      ),
    );
  }

  Widget buildChart() {
    return Container(
      width: 340,
      height: 280,
      padding: 10.around,
      decoration: BoxDecoration(
        borderRadius: 10.borderRadius,
        color: const Color(0xFF5F0EED),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              title: const ChartTitle(
                text: '睡眠',
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                alignment: ChartAlignment.near,
              ),
              //X轴方向的样式
              primaryXAxis: const CategoryAxis(
                //分割线
                majorGridLines: MajorGridLines(width: 0),
                //刻度线
                majorTickLines: MajorTickLines(width: 0),
                //主轴线
                axisLine: AxisLine(width: 0),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              primaryYAxis: const NumericAxis(
                isVisible: false,
              ),
              series: _getDefaultColumnSeries(),
              // tooltipBehavior: TooltipBehavior(
              //   enable: true,
              //   header: '',
              //   canShowMarker: false,
              // ),
            ),
          ),
          10.verticalSpace,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "18H",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ITCAvantGarde",
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "深度睡眠",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "5H",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ITCAvantGarde",
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "浅睡",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "5H",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ITCAvantGarde",
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "清醒",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  /// Get default column series
  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: '周一', y: 6),
          ChartSampleData(x: '周二', y: 3),
          ChartSampleData(x: '周三', y: 7),
          ChartSampleData(x: '周四', y: 10, color: Colors.white),
          ChartSampleData(x: '周五', y: 6),
          ChartSampleData(x: '周六', y: 8),
          ChartSampleData(x: '周日', y: 4),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        // dataLabelSettings: const DataLabelSettings(
        //   isVisible: true,
        //   textStyle: TextStyle(fontSize: 10),
        // ),
        pointColorMapper: (ChartSampleData sales, _) =>
            sales.color ?? const Color(0xFF673EF8),
        borderRadius: 5.borderRadius,
        width: 0.9,
      )
    ];
  }

  Widget buildCard({
    required String msg,
    required String button,
    required Color color,
  }) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: 10.borderRadius,
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            msg,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "ITCAvantGarde",
              fontSize: 14,
            ),
          ),
          10.verticalSpace,
          FilledButton(
            onPressed: () {},
            child: Text(
              button,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "ITCAvantGarde",
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildChart1() {
    return Container(
      width: 340,
      height: 280,
      padding: 20.around,
      decoration: BoxDecoration(
        borderRadius: 10.borderRadius,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "最近心率",
            style: TextStyle(
              color: Color(0xFF797979),
              fontSize: 14,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "68",
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: "ITCAvantGarde",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: "次/分",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                WidgetSpan(child: 10.horizontalSpace),
                const TextSpan(
                  text: "30秒",
                  style: TextStyle(
                    color: Color(0xFF797979),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              //X轴方向的样式
              primaryXAxis: const CategoryAxis(
                //分割线
                //majorGridLines: MajorGridLines(width: 0),
                //刻度线
                majorTickLines: MajorTickLines(width: 0),
                //主轴线
                axisLine: AxisLine(width: 0),
                labelPosition: ChartDataLabelPosition.inside,
                labelPlacement: LabelPlacement.onTicks,
                labelIntersectAction: AxisLabelIntersectAction.hide,
                labelsExtent: 0,
                //labelsExtent: 0,
              ),
              primaryYAxis: const NumericAxis(
                isVisible: false,
              ),
              series: _getDefaultColumnSeries1(),
              // tooltipBehavior: TooltipBehavior(
              //   enable: true,
              //   header: '',
              //   canShowMarker: false,
              // ),
            ),
          ),
        ],
      ),
    );
  }

  /// Get default column series
  List<SplineSeries<ChartSampleData, String>> _getDefaultColumnSeries1() {
    return <SplineSeries<ChartSampleData, String>>[
      SplineSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: '周一', y: 88),
          ChartSampleData(x: '周二', y: 80),
          ChartSampleData(x: '周三', y: 90),
          ChartSampleData(x: '周四', y: 99),
          ChartSampleData(x: '周五', y: 85),
          ChartSampleData(x: '周六', y: 175),
          ChartSampleData(x: '周日', y: 180),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        // dataLabelSettings: const DataLabelSettings(
        //   isVisible: true,
        //   textStyle: TextStyle(fontSize: 10),
        // ),
        pointColorMapper: (ChartSampleData sales, _) =>
            sales.color ?? const Color(0xFFFF3865),
        width: 5,
      ),
      SplineSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: '周一', y: 60),
          ChartSampleData(x: '周二', y: 55),
          ChartSampleData(x: '周三', y: 60),
          ChartSampleData(x: '周四', y: 70),
          ChartSampleData(x: '周五', y: 60),
          ChartSampleData(x: '周六', y: 65),
          ChartSampleData(x: '周日', y: 58),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        // dataLabelSettings: const DataLabelSettings(
        //   isVisible: true,
        //   textStyle: TextStyle(fontSize: 10),
        // ),
        color: const Color(0x66FF3865),
        width: 5,
      )
    ];
  }

  Widget buildChart2() {
    return Container(
      width: 340,
      height: 280,
      padding: 20.around,
      decoration: BoxDecoration(
        borderRadius: 10.borderRadius,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "今日步数",
            style: TextStyle(
              color: Color(0xFF797979),
              fontSize: 14,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "3,423",
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: "ITCAvantGarde",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                WidgetSpan(child: 10.horizontalSpace),
                const TextSpan(
                  text: "/10000步",
                  style: TextStyle(
                    color: Color(0xFF797979),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SfCircularChart(
              series: _getRadialBarDefaultSeries(),
              margin: EdgeInsets.zero,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "10",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "ITCAvantGarde",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "公里",
                    style: TextStyle(
                      color: Color(0xFF797979),
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "6h30m",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "ITCAvantGarde",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "活跃时长",
                    style: TextStyle(
                      color: Color(0xFF797979),
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "343",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "ITCAvantGarde",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "大卡",
                    style: TextStyle(
                      color: Color(0xFF797979),
                      fontSize: 14,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  /// Returns default radial series.
  List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries() {
    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
        maximumValue: 10000,
        dataSource: <ChartSampleData>[
          ChartSampleData(
            x: '',
            y: 3423,
          ),
        ],
        cornerStyle: CornerStyle.endCurve,
        gap: '80%',
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.y,
        pointColorMapper: (datum, index) => const Color(0xFFFF6648),
        trackColor: const Color(0xFFE9E9E9),
      )
    ];
  }
}
