import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weathertask/utils/assets_utils.dart';

import '../../config/theme_colors.dart';

class ImageNetwork extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;
  final Widget? errorWidget;
  final bool cover;
  final bool fill;
  final BoxFit boxFitStatic;
  final bool imageLocale;

  const ImageNetwork({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.errorWidget,
    this.cover = false,
    this.fill = false,
    this.imageLocale = true,
    this.boxFitStatic = BoxFit.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageLocale
        ? Image.asset(
            assetsImages(url!),
            fit: boxFitStatic,
            height: height,
            width: width,
          )
        : CachedNetworkImage(
            height: height,
            width: width,
            imageUrl: url ?? " ",
            fit: fill
                ? BoxFit.fill
                : cover
                    ? BoxFit.cover
                    : BoxFit.contain,
            errorWidget: (context, url, error) => errorWidget != null
                ? errorWidget!
                : const Center(
                    child: Icon(
                      Icons.error,
                      color: TColor.error,
                    ),
                  ),
          );
  }
}
