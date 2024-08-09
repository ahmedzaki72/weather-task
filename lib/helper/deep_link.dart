// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:inews/config/config_base.dart';
// import 'package:share_plus/share_plus.dart';
//
// class DynamicLink {
//   static Future<void> createDynamicLink({
//     String? title,
//     int? postId,
//     String? image,
//   }) async {
//     FirebaseDynamicLinks firebaseDynamicLinks = FirebaseDynamicLinks.instance;
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       link: Uri.parse("${ConfigBase.dynamicLinkFirebasePrefix}$postId/"),
//       uriPrefix: ConfigBase.dynamicLinkFirebasePrefix,
//       androidParameters: const AndroidParameters(
//         packageName: ConfigBase.androidPackageName,
//         minimumVersion: 0,
//       ),
//       iosParameters: const IOSParameters(
//         bundleId: ConfigBase.iosBundleId,
//         minimumVersion: "0",
//       ),
//       socialMetaTagParameters: SocialMetaTagParameters(
//         description: "",
//         imageUrl: Uri.parse(image!),
//         title: title,
//       ),
//     );
//     print("this is prameters $parameters");
//     final ShortDynamicLink shortDynamicLink =
//         await firebaseDynamicLinks.buildShortLink(parameters);
//     print("this is prameters two $parameters");
//     String linkShort = "${shortDynamicLink.shortUrl.toString()}";
//     await Share.share(linkShort, subject: title);
//   }
//
//   static Future<void> initialDynamicLink(BuildContext context) async {
//     FirebaseDynamicLinks.instance.onLink
//         .listen((PendingDynamicLinkData? dynamicLinkData) {
//       final Uri? deepLink = dynamicLinkData!.link;
//       if (deepLink != null) {
//         // print("this is deep link $deepLink");
//         /// handle deep link
//         handleMyLink(deepLink, context);
//       }
//     }).onError((error) {
//       print("this is error to get from  initial dynamic $error");
//     });
//   }
//
//   static void handleMyLink(Uri url, BuildContext context) {
//     // Logger().wtf("this is url $url ");
//     List<String> sepeaterLink = [];
//     sepeaterLink.addAll(url.path.split('/'));
//     // print("this is sepeater link index 1 ${sepeaterLink[1]}");
//     // context.read<ProductByIdCubit>().getProduct(id: sepeaterLink[1].toString());
//     // context
//     //     .read<ProductRecommendationCubit>()
//     //     .getProductRecommendation(productId: sepeaterLink[1].toString());
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //       builder: (context) => const ProductDetailsLoadingOneScreen()),
//     // );
//   }
// }
