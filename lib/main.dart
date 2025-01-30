import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maqsaf_app/screens/login/login_screen.dart';
import 'package:maqsaf_app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'core/data/datasource/configuration/data_configuration.dart';
import 'core/data/datasource/configuration/locator.dart';
import 'core/domain/services/firebase_cloud_messaging_helper.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("رسالة مستلمة في الخلفية: ${message.messageId}");
}

void getToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  print("FCM Token: $token");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FcmHelper.initFcm();

  // await FirebaseMessaging.instance.getInitialMessage();
  //  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print("رسالة مستلمة أثناء تشغيل التطبيق: ${message.notification?.title}");
  // });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      print("📩 إشعار مستلم: ${notification.title} - ${notification.body}");
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("تم فتح التطبيق من خلال إشعار: ${message.notification?.title}");
  });
  getToken();

  /// To Fix Bug In Text Showing In Release Mode
  await ScreenUtil.ensureScreenSize();

  /// To Register In Git IT
  setupLocator();

  /// To init Storage
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: initProviders(),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: ScreenUtilInit(
            minTextAdapt: true,
            designSize: const Size(393.0, 852.0),
            builder: (context, child) {
              return GetMaterialApp(
                title: 'مقصف',
                debugShowCheckedModeBanner: false,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: const TextScaler.linear(1.0),
                    ),
                    child: child!,
                  );
                },
                theme: ThemeData(
                  fontFamily: 'droid_arabi_kufi',
                  primarySwatch: Colors.blue,
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                  useMaterial3: true,
                ),

                home: const SplashScreen(),
                // home: const LoginScreen(),
              );
            }),
      ),
    );
  }
}
