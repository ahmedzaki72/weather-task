// import 'dart:async';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:inews/main.dart';
// import 'package:inews/modules/bottom_navigation_bar/bloc/layout_cubit.dart';
// import 'package:inews/modules/bottom_navigation_bar/view/bottom_navigation_bar.dart';
// import 'package:inews/modules/home/bloc/urgent_cubit/urgent_cubit.dart';
// import 'package:inews/modules/my_news/views/my_news_screen.dart';
// import 'package:inews/modules/news_details/bloc/post_details_cubit.dart';
// import 'package:inews/modules/news_details/views/news_details_screen.dart';
// import 'package:logger/logger.dart';
//
// class NotificationsCustom {
//   final StreamController<String?> selectNotificationStream =
//       StreamController<String?>.broadcast();
//
//   /// request permissions
//   static Future<void> requestPermissions() async {
//     FirebaseMessaging messaging = await FirebaseMessaging.instance;
//
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print("user granted permissions");
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print("user granted provisional  permissions");
//     } else {
//       print("user declined or has not accept permissions");
//     }
//   }
//
//   /// get fcm token
//   // Future<void> getFcmToken() async {
//   //   String? fcmToken;
//   //   fcmToken = await FirebaseMessaging.instance.getToken();
//   //   if (fcmToken != null) {
//   //     saveToken(fcmToken: fcmToken);
//   //   }
//   // }
//
//   // /// store fcm in backend and check fcm token store or not
//   // void saveToken({String? fcmToken}) async {
//   //   await FirebaseFirestore.instance
//   //       .collection("UsersToken")
//   //       .get()
//   //       .then((value) async {
//   //     final oldFcmToken = value.docs.map((e) => e.get('token')).toList();
//   //     if (oldFcmToken.contains(fcmToken) == false) {
//   //       await FirebaseFirestore.instance
//   //           .collection("UsersToken")
//   //           .doc()
//   //           .set({'token': fcmToken});
//   //     }
//   //   });
//   // }
//
//   /// create a channel with id if have channel
//   void createChannel(
//       {FlutterLocalNotificationsPlugin?
//           flutterLocalNotificationsPlugin}) async {
//     await flutterLocalNotificationsPlugin!
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(
//           const AndroidNotificationChannel(
//             'high_importance_channel', // id
//             'High Importance Notifications', // title
//             importance: Importance.max,
//           ),
//         );
//   }
//
//   /// foreground notification ios
//   void iosForeground() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: false, // Required to display a heads up notification
//       badge: false,
//       sound: false,
//     );
//   }
//
//   /// flutter local notification plugin
//   initInfo(BuildContext? context) {
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//     var androidInitialize = const AndroidInitializationSettings('ic_launcher');
//     var darwinInitializeIos = const DarwinInitializationSettings();
//     var initializationSettings = InitializationSettings(
//         android: androidInitialize, iOS: darwinInitializeIos);
//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) async {
//         // print("this is payload id ${notificationResponse.id}");
//         // print("this is payload ${notificationResponse.payload!.isEmpty}");
//         // print("notification on receive ${notificationResponse.payload}");
//         if (notificationResponse.payload != null ||
//             notificationResponse.payload!.isNotEmpty) {
//           // Logger().wtf(notificationResponse.payload);
//           //   // Logger().wtf(notificationResponse.payload!);
//           //   print("navigation here ");
//           Map<String, dynamic> figureMap = {};
//           var jsonString = notificationResponse.payload!.substring(1,
//               notificationResponse.payload!.length - 1); // Remove curly braces
//           List<String> keyValuePairs = jsonString.split(', ');
//           for (String pair in keyValuePairs) {
//             List<String> keyValue = pair.split(': ');
//             String key = keyValue[0];
//             String value = keyValue[1];
//             figureMap[key] = value;
//           }
//           if (figureMap['type_not'] == "urgent") {
//             layoutCubit.changeBottomNavigationBar(0);
//             urgentCubit.getUrgent(isFirstRefresh: true);
//             Navigator.of(navigationKey.currentContext!)
//                 .popUntil((route) => route.isFirst);
//             Navigator.pushReplacementNamed(
//                 navigationKey.currentContext!, BottomNavigations.routeName);
//             layoutCubit.changeHomeInitialIndex(1);
//           } else {
//             postDetailsCubit.getPostDetails(id: int.parse(figureMap['id']));
//             Navigator.pushNamed(
//                 navigationKey.currentContext!, NewsDetailsScreen.routeName);
//           }
//           ;
//         }
//       },
//     );
//
//     /// call create channel
//     createChannel(
//         flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin);
//
//     /// call foreground notification
//     iosForeground();
//
//     /// firebase messaging onMessage
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       // print("-------------------- onMessage -----------------");
//       // print(
//       //     "onMessage : ${message.notification!.title} / ${message.notification!.body}");
//       BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
//         message.notification!.body.toString(),
//         htmlFormatBigText: true,
//         contentTitle: message.notification!.title.toString(),
//         htmlFormatContentTitle: true,
//       );
//       // final sound = 'notification_sound.wav';
//       AndroidNotificationDetails androidPlatformChannelSpecific =
//           AndroidNotificationDetails(
//         'high_importance_channel 7', // id
//         'High Importance Notifications',
//         importance: Importance.high,
//         styleInformation: bigTextStyleInformation, priority: Priority.high,
//         playSound: true,
//         // sound: RawResourceAndroidNotificationSound(sound.split('.').first),
//       );
//
//       DarwinNotificationDetails iosPlatformChannelSpecific =
//           // DarwinNotificationDetails(sound: sound, presentSound: true);
//           const DarwinNotificationDetails(presentSound: true);
//
//       NotificationDetails platformChannelSpecific = NotificationDetails(
//         android: androidPlatformChannelSpecific,
//         iOS: iosPlatformChannelSpecific,
//       );
//       // print("this is data message id ${message.messageId}");
//       // print("this is data message ${message.data}");
//       // print("this is data body ${message.data}");
//       // print("this is data notification ${message.notification}");
//       await flutterLocalNotificationsPlugin.show(
//         message.notification!.hashCode,
//         message.notification!.title,
//         message.notification!.body,
//         platformChannelSpecific,
//         payload: message.data.toString(),
//       );
//     });
//   }
//
//   /// firebase subscription specific topic
// // void subscriptionTopic() async {
// //   await FirebaseMessaging.instance.subscribeToTopic("broadcast").then((value) {
// //     print("subscription success done");
// //   });
// // }
//
// //////
//   Future<void> setupInteractedMessage() async {
//     // Get any messages which caused the application to open from
//     // a terminated state.
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//
//     // If the message also contains a data property with a "type" of "chat",
//     // navigate to a chat screen
//     if (initialMessage != null) {
//       _handleMessage(initialMessage);
//     }
//
//     // Also handle any interaction when the app is in the background via a
//     // Stream listener
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
//   }
//
//   void _handleMessage(RemoteMessage message) {
//     // Logger().wtf(message.data);
//     if (message.data['type_not'] == "urgent") {
//       layoutCubit.changeBottomNavigationBar(0);
//       urgentCubit.getUrgent(isFirstRefresh: true);
//       Navigator.of(navigationKey.currentContext!)
//           .popUntil((route) => route.isFirst);
//       Navigator.pushReplacementNamed(
//           navigationKey.currentContext!, BottomNavigations.routeName);
//       layoutCubit.changeHomeInitialIndex(1);
//     } else {
//       postDetailsCubit.getPostDetails(id: int.parse(message.data['id']));
//       Navigator.pushNamed(
//           navigationKey.currentContext!, NewsDetailsScreen.routeName);
//     }
//     ;
//   }
// }
