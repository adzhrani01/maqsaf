import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../constants/constants.dart';


class FcmHelper {
  // FCM Messaging >> FCM = Firebase Cloud Messaging
  static late FirebaseMessaging messaging;

  // Notification lib
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// this function will initialize firebase and fcm instance
  static Future<void> initFcm() async {
    try {
      // initialize fcm and firebase core
      // uncomment the 4 comments below if you didn't already initialize firebase in the main
      await Firebase.initializeApp(
          //  only uncomment this line if you set up firebase vie firebase cli
          // options: DefaultFirebaseOptions.currentPlatform,
          );

      messaging = FirebaseMessaging.instance;
      // initialize notifications channel and libraries
      await _initNotification();

      // setup notification click handler
      await setupInteractedMessage();

      // notification settings handler
      await _setupFcmNotificationSettings();

      // background and foreground handlers
      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
      // listen to notifications clicks
    } catch (error) {
      log(error.toString());
    }
  }

  static Future<void> setupInteractedMessage() async {
    try {
      RemoteMessage? initialMessage = await messaging.getInitialMessage();
      if (initialMessage != null) {
        _handleMessage(initialMessage);
      }
      // If there's a context menu action, handle it here
      log("Initial Message: ${initialMessage?.data}");

      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    } catch (e) {
      log(e.toString());
    }
  }

  static void _handleMessage(RemoteMessage message) async {
    log('onMessageOpenedApp ${message.data}');
    Map<String, dynamic> data = message.data;
    log('onMessageOpenedApp $data');
    int targetId = int.parse(data["target_id"] ?? "-1");
    String clickAction = data["click_action"] ?? "";
    log("clickAction: $clickAction");
    switch (clickAction) {}
  }

  ///handle fcm notification settings (sound,badge..etc)
  static Future<void> _setupFcmNotificationSettings() async {
    //show notification with sound and badge
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );
    //NotificationSettings settings
    messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      announcement: false,
      criticalAlert: false,
      provisional: false,
      carPlay: false,
    );
  }

  ///handle fcm notification when app is closed/terminated
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    // _showNotification(
    //   id: 1,
    //   title: message.notification?.title ?? 'Title',
    //   body: message.notification?.body ?? 'Body',
    // );
    log("message background $message");
    log("message content ${message.data}");
    log("message messageId ${message.messageId}");
    log("message messageType ${message.messageType}");

    log("message.notification ${message.notification}");

    if (message.notification != null) {
      log("message.notification title ${message.notification?.title}");
      log("message.notification body ${message.notification?.body}");
      //No need for showing Notification manually.
      //For BackgroundMessages: Firebase automatically sends a Notification.
      //If you call the flutterLocalNotificationsPlugin.show()-Method for
      //example the Notification will be displayed twice.
    } else {
      showNotification(message, "${message.data}");
    }
  }

  //handle fcm notification when app is open
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    log("message foreground ${message.data}");
    log("message notification title ${message.notification?.title}");
    log("message notification body ${message.notification?.body}");
    // _showNotification(
    //   id: 1,
    //   title: message.notification?.title ?? 'Title',
    //   body: message.notification?.body ?? 'Body',
    //   // icon: '@drawable/ic_launcher',
    //   // largeIcon: DrawableResourceAndroidBitmap('@mipmap/alquds_icon'),
    // );
    showNotification(message, "${message.data}");
    // Check if the notification type is wallet
  }

  static String? _getNotificationImageUrl(RemoteNotification notification) {
    if (Platform.isIOS && notification.apple != null) {
      return notification.apple?.imageUrl;
    }
    if (Platform.isAndroid && notification.android != null) {
      return notification.android?.imageUrl;
    }
    return null;
  }

  static showNotification(RemoteMessage message, String payload) async {
    String? imageUrl = message.notification != null
        ? _getNotificationImageUrl(message.notification!) ??
            message.data["image"]
        : message.data["image"];
    BigPictureStyleInformation? bigPictureStyleInformation;
    final http.Response? response;
    if (imageUrl != null && imageUrl.isNotEmpty ) {
    // if (imageUrl != null && imageUrl.isNotEmpty && imageUrl.isURL) {
      response = await http.get(Uri.parse(imageUrl));
      bigPictureStyleInformation = BigPictureStyleInformation(
        ByteArrayAndroidBitmap.fromBase64String(
          base64Encode(response.bodyBytes),
        ),
        contentTitle: message.notification?.title ?? applicationName,
        htmlFormatContentTitle: true,
        summaryText: message.notification?.body ?? "",
        htmlFormatSummaryText: true,
        hideExpandedLargeIcon: true,
        largeIcon: ByteArrayAndroidBitmap.fromBase64String(base64Encode(
          response.bodyBytes,
        )),
      );
    }

    String? sound = (Platform.isIOS && message.notification?.apple != null)
        ? message.notification?.apple?.sound?.name
        : (Platform.isAndroid && message.notification?.android == null)
            ? message.notification?.android?.sound
            : null;
    log("sound: $sound");
    DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: sound,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel', 'High Importance Notifications',
      // sound: const RawResourceAndroidNotificationSound('notification'),
      playSound: true,
      enableVibration: true,
      visibility: NotificationVisibility.public,
      enableLights: true,
      autoCancel: true,
      color: Colors.white,
      largeIcon: bigPictureStyleInformation == null
          ? const DrawableResourceAndroidBitmap(
              '@drawable/ic_launcher')
          : bigPictureStyleInformation.largeIcon,
      additionalFlags: Int32List.fromList(<int>[16 * (0x00000010)]),
      importance: Importance.high,
      priority: Priority.high,
      styleInformation: bigPictureStyleInformation,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    log('messageId: ${message.messageId}');
    Map<String, dynamic> data = message.data;
    String title =
        data['title'] ?? (message.notification?.title ?? applicationName);
    String body = data['body'] ?? (message.notification?.body ?? "");
    // log('message ${message.notification!.title}');
    log('message.data ${message.data}');
    log('Payload: $payload');

    await flutterLocalNotificationsPlugin
        .show(200, title, body, notificationDetails, payload: payload);
  }

  ///init notifications channels
  static _initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      'ic_launcher',
    );

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    // flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()!
    //     .requestPermission();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      final NotificationAppLaunchDetails? details =
          await flutterLocalNotificationsPlugin
              .getNotificationAppLaunchDetails();
      log("Payload: ${details!.notificationResponse!.payload}");
      log("Details: $details");
      List<String> str = details.notificationResponse!.payload!
          .replaceAll("{", "")
          .replaceAll("}", "")
          .split(",");
      log("String: $str");
      Map<String, dynamic> data = {};
      for (int i = 0; i < str.length; i++) {
        List<String> s = str[i].split(":");
        log("s.length ${s.length}");
        log(s.toString());
        log("s[0]: ${s[0]}");
        data.putIfAbsent(s[0].trim(), () => s.length > 1 ? s[1].trim() : "");
      }
      int targetId = int.parse(data["target_id"] ?? "-1");
      String clickAction = data["click_action"] ?? "";
      log("clickAction: $clickAction");
      switch (clickAction) {}
    });
  }
}
