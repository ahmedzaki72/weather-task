import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathertask/config/theme_colors.dart';
import 'package:weathertask/custom_widgets/custom_text.dart';
import 'package:weathertask/modules/result/widget/custom_app_bar.dart';
import 'package:weathertask/modules/result_details/bloc/result_details_cubit/result_details_cubit.dart';
import 'package:weathertask/modules/result_details/bloc/result_details_cubit/result_details_states.dart';
import 'package:weathertask/modules/result_details/widget/custom_charts_card_w.dart';
import 'package:weathertask/modules/result_details/widget/custom_list_forecast_w.dart';
import 'package:weathertask/modules/result_details/widget/custom_result_d_card_w.dart';
import 'package:weathertask/utils/sized_box.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ResultDetailsDesktopLayoutW extends StatelessWidget {
  final String? name;
  const ResultDetailsDesktopLayoutW({
    super.key,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: name!,
          ),
          BlocBuilder<ResultDetailsCubit, ResultDetailsStates>(
              builder: (context, states) {
            if (states is ResultDetailsLoadingStates) {
              return Expanded(
                child: Center(
                  child: SpinKitSpinningLines(
                    color: TColor.meanColor,
                    size: 40.sp,
                  ),
                ),
              );
            } else if (states is ResultDetailsSuccessStates) {
              return Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Sbox(h: 20),
                    CustomResultDCardW(
                      dailyModels: states.forecastDailyModels!.daily,
                      dailyUnitModels: states.forecastDailyModels!.daily_units,
                      name: name,
                    ),
                    const Sbox(h: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: const CustomText(
                        text: '5-Day Forecast',
                        fontSize: 24,
                        fontW: FontWeight.bold,
                      ),
                    ),
                    const Sbox(h: 16),
                    CustomListForecastW(
                      dailyUnitModels: states.forecastDailyModels!.daily_units,
                      dailyModels: states.forecastDailyModels!.daily,
                    ),
                    const Sbox(h: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: const CustomText(
                        text: '5-Day Forecast Charts',
                        fontSize: 24,
                        fontW: FontWeight.bold,
                      ),
                    ),
                    const Sbox(h: 16),
                    CustomChartsCardW(
                      dailyModels: states.forecastDailyModels!.daily,
                    ),
                    const Sbox(h: 16),
                  ],
                ),
              );
            } else if (states is ResultDetailsErrorStates) {
              return Expanded(
                child: Center(
                  child: CustomText(
                    text: states.error,
                    fontW: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}
