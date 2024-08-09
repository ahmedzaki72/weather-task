import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertask/constant/path_route_name.dart';
import 'package:weathertask/custom_widgets/adaptive_layout.dart';
import 'package:weathertask/modules/result_details/bloc/result_details_cubit/result_details_cubit.dart';
import 'package:weathertask/modules/result_details/widget/result_details_desktop_layout_w.dart';
import 'package:weathertask/modules/result_details/widget/result_details_mobile_layout_w.dart';
import 'package:weathertask/modules/result_details/widget/result_details_tablet_layout_w.dart';

class ResultDetailsScreen extends StatelessWidget {
  static const String routeName = PathRouteName.resultDetails;
  final String? name;
  const ResultDetailsScreen({
    super.key,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => ResultDetailsMobileLayoutW(
          name: name,
        ),
        tabletLayout: (context) => ResultDetailsTabletLayoutW(
          name: name,
        ),
        desktopLayout: (context) => ResultDetailsDesktopLayoutW(
          name: name,
        ),
      ),
    );
  }
}
