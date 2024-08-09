import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathertask/custom_widgets/custom_text.dart';
import 'package:weathertask/helper/extensions.dart';
import 'package:weathertask/modules/result/bloc/city_search_cubit/city_search_cubit.dart';
import 'package:weathertask/modules/result/bloc/city_search_cubit/city_search_states.dart';
import 'package:weathertask/modules/result/widget/custom_app_bar.dart';
import 'package:weathertask/modules/result/widget/custom_body_gird_w.dart';
import 'package:weathertask/modules/result/widget/custom_shimmer_loading_w.dart';
import 'package:weathertask/modules/result_details/bloc/result_details_cubit/result_details_cubit.dart';
import 'package:weathertask/modules/result_details/view/result_details_screen.dart';

class ResultTabletLayoutW extends StatelessWidget {
  const ResultTabletLayoutW({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(
            title: "Result",
          ),
          BlocBuilder<CitySearchCubit, CitySearchStates>(
              builder: (context, states) {
            if (states is CitySearchLoadingStates) {
              return const CustomShimmerLoadingW(
                sliverGridDelegateWithFixedCrossAxisCount:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.88,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              );
            } else if (states is CitySearchSuccessStates) {
              return states.cityModels!.results != null
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.88,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: states.cityModels!.results!.length,
                        padding: EdgeInsets.symmetric(
                            vertical: 20.w, horizontal: 10.w),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              resultDetailsCubit.resultDetails(
                                lat:
                                    states.cityModels!.results![index].latitude,
                                long: states
                                    .cityModels!.results![index].longitude,
                              );
                              context.toView(
                                ResultDetailsScreen(
                                  name: states.cityModels!.results![index].name,
                                ),
                              );
                            },
                            child: CustomBodyGirdW(
                              cityResultModels:
                                  states.cityModels!.results![index],
                            ),
                          );
                        },
                      ),
                    )
                  : const Expanded(
                      child: Center(
                        child: CustomText(
                          text: "Oops City name not match",
                          fontW: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    );
            } else if (states is CitySearchErrorStates) {
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
