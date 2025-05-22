// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationServices{
//   FirebaseMessaging messaging=FirebaseMessaging.instance;
//   void requestNotificationPermission()async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print("Notification permission granted");
//     }
//     else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//       print("Notification permission granted for provisional");
//     }
//     else {
//       print("Notification permission not granted");
//     }
//
//
//   }
//   Future<String> getToken() async {
//     String? token = await messaging.getToken();
//     return token!;
//   }
//   // void isTokenRefershed() async {
//   //   messaging.onTokenRefresh.listen((event) {
//   //     event.toString();
//   //   });
//   // }
//   void setupTokenRefreshListener() { // Renamed
//     messaging.onTokenRefresh.listen((newToken) {
//       print("FCM Token Refreshed: $newToken");
//       // TODO: Send this newToken to your application server.
//     }).onError((err) {
//       print("Error listening to token refresh: $err");
//     });
//   }
// }
//
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
//
// Future<void> initializeLocalNotifications() async {
//   const AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('@mipmap/ic_launcher'); // or your custom icon
//
//   final DarwinInitializationSettings initializationSettingsIOS =
//   DarwinInitializationSettings(
//     requestAlertPermission: false, // FCM already handles this
//     requestBadgePermission: false,
//     requestSoundPermission: false,
//     // onDidReceiveLocalNotification: onDidReceiveLocalNotification, // For older iOS
//   );
//
//   final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsIOS,
//   );
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) async {
//         // Handle notification tapped when app is in foreground/background
//         print('notification payload: ${response.payload}');
//         // You can navigate or perform actions based on the payload
//       });
//
//   // Create a channel for Android (important for Android 8.0+)
//   const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     description: 'This channel is used for important notifications.', // description
//     importance: Importance.high,
//     playSound: true,
//   );
//
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//       AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Got a message whilst in the foreground!');
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//
//     if (notification != null && android != null) { // Or check for apple for iOS
//       flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             'high_importance_channel', // Same channel ID as created
//             'High Importance Notifications',
//             channelDescription: 'This channel is used for important notifications.',
//             icon: android.smallIcon ?? '@mipmap/ic_launcher', // Or your custom icon
//             // other properties...
//           ),
//           iOS: DarwinNotificationDetails(
//             presentAlert: true,
//             presentBadge: true,
//             presentSound: true,
//           ),
//         ),
//         payload: message.data['payload_key']?.toString(), // Optional: data to pass when tapped
//       );
//     }
//   });
// }
//
//
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Call this method once during app initialization (e.g., in main() or SplashScreen initState)
  Future<void> initialize() async {
    await _requestNotificationPermission();
    await _initializeLocalNotifications();
    _setupForegroundMessageHandler();
    setupTokenRefreshListener(); // Listen for token refreshes
    // Note: Handling tapped notifications (getInitialMessage, onMessageOpenedApp)
    // is often done outside this class, where navigator context is available,
    // or by passing a callback for navigation.
  }

  Future<void> _requestNotificationPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false, // Usually not needed unless for specific accessibility
      badge: true,
      carPlay: false,    // Usually not needed
      criticalAlert: false, // Only for very specific, high-priority alerts
      provisional: false, // Set to true if you want silent provisional auth on iOS
      sound: true,
    );
    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   print("Notification permission granted");
    // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    //   print("Notification permission granted for provisional");
    // } else {
    //   print("Notification permission not granted");
    // }

  }

  Future<String?> getToken() async {
    String? token = await _messaging.getToken();
    print("FCM Token: $token");
    return token;
  }

  void setupTokenRefreshListener() {
    _messaging.onTokenRefresh.listen((newToken) {
      print("FCM Token Refreshed: $newToken");
      // TODO: Send this newToken to your application server.
    }).onError((err) {
      print("Error listening to token refresh: $err");
    });
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification, // For older iOS < 10
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) async {
          print('Local notification tapped, payload: ${response.payload}');
          // Handle tap on local notification (e.g., navigate)
          // This is for local notifications shown by flutter_local_notifications itself.
        });

    // Create a channel for Android (important for Android 8.0+)
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
      playSound: true,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  void _setupForegroundMessageHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        // Prepare Android specific details
        AndroidNotificationDetails? androidDetails;
        if (message.notification?.android != null) {
          androidDetails = AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription: 'This channel is used for important notifications.',
            icon: message.notification!.android!.smallIcon ?? '@mipmap/ic_launcher',
            importance: Importance.high,
            playSound: true,
          );
        }

        // Show local notification
        _flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: androidDetails ?? const AndroidNotificationDetails(
              'high_importance_channel',
              'High Importance Notifications',
              channelDescription: 'This channel is used for important notifications.',
              importance: Importance.high,
              playSound: true,
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
          payload: message.data.isNotEmpty ? message.data.toString() : null, // Pass data as payload
        );
      }
    });
  }

  // Helper to show a simple local notification (can be called from elsewhere if needed)
  Future<void> showSimpleLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'high_importance_channel', 'High Importance Notifications',
        channelDescription: 'This channel is used for important notifications.',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const DarwinNotificationDetails iosNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics,
        payload: payload);
  }
}