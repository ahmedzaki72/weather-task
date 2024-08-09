import 'package:flutter/material.dart';
import 'package:weathertask/modules/home/view/home_screen.dart';
import 'package:weathertask/modules/result/view/result_screen.dart';
import 'package:weathertask/modules/result_details/view/result_details_screen.dart';
import 'package:weathertask/modules/splash/view/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ResultScreen.routeName: (context) => const ResultScreen(),
  ResultDetailsScreen.routeName: (context) => const ResultDetailsScreen(),
};
