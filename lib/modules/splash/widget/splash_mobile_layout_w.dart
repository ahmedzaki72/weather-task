import 'package:flutter/material.dart';
import 'package:weathertask/utils/assets_utils.dart';

class SplashMobileLayoutW extends StatelessWidget {
  const SplashMobileLayoutW({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            assetsImages("splash.png"),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
