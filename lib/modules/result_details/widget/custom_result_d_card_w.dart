import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathertask/config/theme_colors.dart';
import 'package:weathertask/custom_widgets/custom_text.dart';
import 'package:weathertask/modules/result_details/models/forecast_daily_models/daily_models.dart';
import 'package:weathertask/modules/result_details/models/forecast_daily_models/daily_unit_models.dart';
import 'package:weathertask/utils/sized_box.dart';

class CustomResultDCardW extends StatelessWidget {
  final DailyModels? dailyModels;
  final DailyUnitModels? dailyUnitModels;
  final String? name;
  const CustomResultDCardW({
    super.key,
    this.dailyModels,
    this.dailyUnitModels,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: name,
                    fontSize: 32,
                    fontW: FontWeight.bold,
                  ),
                  CustomText(
                    text: dailyModels!.weatherDescription!,
                    fontSize: 24,
                    color: Colors.grey,
                  ),
                ],
              ),
              const Sbox(h: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text:
                        "${dailyModels!.temperatureMin!.toString()} ${dailyUnitModels!.temperature_2m_min}  /  ${dailyModels!.temperatureMax!.toString()} ${dailyUnitModels!.temperature_2m_max}",
                    fontSize: 30,
                    color: TColor.color2,
                  ),
                  const Sbox(w: 10),
                  Icon(
                    dailyModels!.weatherIcon!,
                    size: 50,
                  ),
                ],
              ),
              const Sbox(h: 8),
            ],
          ),
        ),
      ),
    );
  }
}
