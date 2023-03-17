import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:remora/base/base_widget.dart';

class MyNotification extends BaseWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  MyNotification({super.key});

  void initNotification() async {
    // initialisation de notification(Android Side) en donnant le nom de l'icon 'ic_launcher'
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_launcher');
    //initialisation de notification(IOS Side)
    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );
    //initialisation de notification en link les deux (Android, IOS) au parametre de la notification
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (isChannel) {
        debugPrint('notification payload${isChannel.payload!}');
      },
      // onSelectNotification: (payload) async {
      //   if (payload != null) {
      //     debugPrint('notification payload' + payload);
      //   }
      // },
    );

    // Register to receive BackgroundFetch events after app is terminated.
    // Requires {stopOnTerminate: false, enableHeadless: true}
    // var n =
    //     await BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
    // log("==============================> $n");
    // Enable integration testing with the Flutter Driver extension.
    // See https://flutter.io/testing/ for more info.
  }

  void notification(String title, String body, {bool isChannel = false}) async {
    var androidPlatformChannel = const AndroidNotificationDetails(
        'koura_notification', 'koura_notification', //"channel_for_messages",
        icon: 'ic_launcher',
        importance: Importance.max,
        priority: Priority.max,
        largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'));
    var iOSPlatformChannel = const DarwinNotificationDetails();
    var platformChannel = NotificationDetails(
        android: androidPlatformChannel, iOS: iOSPlatformChannel);

    await flutterLocalNotificationsPlugin.show(
        isChannel ? 1 : 0, title, body, platformChannel,
        payload: isChannel.toString());
  }

  @override
  BaseWidgetState<BaseWidget> getState() {
    // TODO: implement getState
    throw UnimplementedError();
  }
}
