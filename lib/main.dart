import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathertask/config/route.dart';
import 'package:weathertask/generated/l10n.dart';
import 'package:weathertask/modules/result/bloc/city_search_cubit/city_search_cubit.dart';
import 'package:weathertask/modules/result_details/bloc/result_details_cubit/result_details_cubit.dart';
import 'package:weathertask/modules/splash/view/splash_screen.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CitySearchCubit(),
        ),
        BlocProvider(
          create: (context) => ResultDetailsCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 928),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Weather App',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: routes,
          navigatorKey: navigationKey,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
