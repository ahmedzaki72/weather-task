import 'package:flutter/material.dart';
import 'package:weathertask/constant/path_route_name.dart';
import 'package:weathertask/custom_widgets/adaptive_layout.dart';
import 'package:weathertask/modules/home/widget/home_desktop_layout_w.dart';
import 'package:weathertask/modules/home/widget/home_mobile_layout_w.dart';
import 'package:weathertask/modules/home/widget/home_tablet_layout_w.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = PathRouteName.home;
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const HomeMobileLayoutW(),
        tabletLayout: (context) => const HomeTabletLayoutW(),
        desktopLayout: (context) => const HomeDesktopLayoutW(),
      ),
    );
  }
}
