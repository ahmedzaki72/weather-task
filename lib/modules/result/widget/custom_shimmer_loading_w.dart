import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weathertask/config/theme_colors.dart';

class CustomShimmerLoadingW extends StatelessWidget {
  final SliverGridDelegateWithFixedCrossAxisCount? sliverGridDelegateWithFixedCrossAxisCount;
  const CustomShimmerLoadingW({super.key, this.sliverGridDelegateWithFixedCrossAxisCount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: sliverGridDelegateWithFixedCrossAxisCount!,
        itemCount: 20,
        padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 10.w),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[300]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 395.w,
                    height: 125.w,
                    decoration: BoxDecoration(
                        color: TColor.shimmerLoading,
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
