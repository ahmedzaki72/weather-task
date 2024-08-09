import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathertask/config/theme_colors.dart';
import 'package:weathertask/custom_widgets/custom_text.dart';
import 'package:weathertask/modules/result/models/city_models/city_result_models.dart';
import 'package:weathertask/utils/sized_box.dart';

class CustomBodyGirdW extends StatelessWidget {
  final CityResultModels? cityResultModels;
  const CustomBodyGirdW({
    super.key,
    this.cityResultModels,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    return Container(
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
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: cityResultModels!.name,
            fontSize: 18,
            fontW: FontWeight.bold,
          ),
          const Sbox(
            h: 5,
          ),
          CustomText(
            text: cityResultModels!.weatherData != null
                ? "${cityResultModels!.weatherData!.current_weather!.temperature} ${cityResultModels!.weatherData!.current_weather_units!.temperature}"
                : "",
            fontSize: 16,
            color: TColor.color2,
          ),
          const Sbox(
            h: 5,
          ),
          Icon(
            cityResultModels!.weatherData!.current_weather!.weatherIcon,
            size: 25.sp,
          ),
          CustomText(
            text: cityResultModels!.weatherData != null
                ? "${cityResultModels!.weatherData!.current_weather!.weatherDescription}"
                : "",
            fontSize: 14,
            fontW: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
