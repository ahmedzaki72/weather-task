import 'package:flutter/material.dart';
import 'package:weathertask/constant/path_route_name.dart';
import 'package:weathertask/custom_widgets/adaptive_layout.dart';
import 'package:weathertask/modules/result/bloc/city_search_cubit/city_search_cubit.dart';
import 'package:weathertask/modules/result/widget/result_desktop_layout_w.dart';
import 'package:weathertask/modules/result/widget/result_mobile_layout_w.dart';
import 'package:weathertask/modules/result/widget/result_tablet_layout_w.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = PathRouteName.result;
  final String? name;
  const ResultScreen({super.key, this.name,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          citySearchCubit.citySearch(cityName: name);
        },
        child: AdaptiveLayout(
          mobileLayout: (context) => const ResultMobileLayoutW(),
          tabletLayout: (context) => const ResultTabletLayoutW(),
          desktopLayout: (context) => const ResultDesktopLayoutW(),
        ),
      ),
    );
  }
}
