import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathertask/config/theme_colors.dart';
import 'package:weathertask/custom_widgets/custom_text.dart';
import 'package:weathertask/modules/result_details/models/forecast_daily_models/daily_models.dart';
import 'package:weathertask/modules/result_details/models/forecast_daily_models/daily_unit_models.dart';

class CustomListForecastW extends StatelessWidget {
  final DailyModels? dailyModels;
  final DailyUnitModels? dailyUnitModels;
  const CustomListForecastW({
    super.key,
    this.dailyModels,
    this.dailyUnitModels,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dailyModels!.time!.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 10.w),
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                dailyModels!.listIcons![index],
                size:  mediaQuery > 900 ? 20.sp : 30.sp,
              ),
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomText(
                  text:
                      '${dailyModels!.temperature_2m_min![index]} ${dailyUnitModels!.temperature_2m_min} /  ${dailyModels!.temperature_2m_max![index]} ${dailyUnitModels!.temperature_2m_max}',
                  fontSize: 20,
                  fontW: FontWeight.w600,
                  color: TColor.color2,
                ),
              ),
              trailing: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: CustomText(
                  text: "${dailyModels!.listName![index]}",
                  fontSize: mediaQuery > 900 ? 8 :  14,
                  fontW: FontWeight.w600,
                ),
              ),
              //,
            ),
          ),
        );
      },
    );
  }
}
