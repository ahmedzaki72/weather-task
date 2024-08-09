import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weathertask/modules/result_details/models/forecast_daily_models/daily_models.dart';

class CustomChartsCardW extends StatelessWidget {
  final DailyModels? dailyModels;
  const CustomChartsCardW({
    super.key,
    this.dailyModels,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: SfCartesianChart(
            primaryXAxis: const CategoryAxis(),
            series: <CartesianSeries<Map<String, dynamic>, String>>[
              SplineSeries(
                dataSource: List.generate(
                    dailyModels!.listDateTime!.length,
                    (index) => {
                          'day':  DateFormat('d').format(DateTime.parse(dailyModels!.listDateTime![index].toString())),
                          'value': dailyModels!.temperature_2m_min![index],
                        }),
                xValueMapper: (f, _) {
                  return f["day"] as String;
                },
                yValueMapper: (f, _) {
                  return f['value'] as double;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
