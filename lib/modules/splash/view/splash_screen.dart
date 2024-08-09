import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weathertask/constant/path_route_name.dart';
import 'package:weathertask/custom_widgets/adaptive_layout.dart';
import 'package:weathertask/helper/extensions.dart';
import 'package:weathertask/modules/home/view/home_screen.dart';
import 'package:weathertask/modules/splash/widget/splash_mobile_layout_w.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = PathRouteName.splash;
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  /// get lat and long
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.

        // Fluttertoast.showToast(
        //   msg: "تم رفض أذونات الموقع",
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: TColor.redAccent,
        //   textColor: Colors.white,
        //   fontSize: 16.sp,
        // );

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // Fluttertoast.showToast(
      //   msg: "أذونات الموقع مرفوضة بشكل دائم ، ولا يمكننا طلب أذونات",
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      //   timeInSecForIosWeb: 1,
      //   backgroundColor: TColor.redAccent,
      //   textColor: Colors.white,
      //   fontSize: 16.sp,
      // );

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      try {
        var x = await Geolocator.getCurrentPosition();
      } catch (e) {
        // Fluttertoast.showToast(
        //   msg: "خدمات الموقع معطلة",
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: TColor.redAccent,
        //   textColor: Colors.white,
        //   fontSize: 16.sp,
        // );
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      // return Future.error('Location services are disabled.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    // lat = position.latitude.toString();
    // lng = position.longitude.toString();
    setState(() {});
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
          context.pushNamed(HomeScreen.routeName);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const SplashMobileLayoutW(),
        tabletLayout: (context) => const SizedBox(),
        desktopLayout: (context) => const SizedBox(),
      ),
    );
  }
}
