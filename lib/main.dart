import 'package:apod/view/pages/explanation_page.dart';
import 'package:apod/view_model/rocket_details.dart';
import 'package:apod/view_model/upcoming_mission_details.dart';
import 'package:apod/view/pages/splash_screen.dart';
import 'package:apod/view_model/provider/apod_provider.dart';
import 'package:apod/widget/custom_theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'model/notification/notification_services.dart';


// Must be a top-level function (not a class method) for background/terminated handling
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Handling a background message: ${message.messageId}");
  print('Message data: ${message.data}');
  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
}
final NotificationServices notificationServices = NotificationServices(); // Create an instance

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Set the background messaging handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // Initialize notification services
  await notificationServices.initialize(); // <--- Initialize here

  // Setup handler for tapped system tray notifications
  _setupInteractedMessage(); // <--- Call your setup for tapped notifications
  runApp(const MyApp());
}
// Place this at the top level or in a place accessible from main
void _setupInteractedMessage() async {
  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    _handleMessageOpenedApp(initialMessage);
  }
  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);
}

void _handleMessageOpenedApp(RemoteMessage message) {
  print('[MAIN] Message opened app: ${message.messageId}');
  print('[MAIN] Data: ${message.data}');
  if (message.notification != null) {
    print('[MAIN] Notification: ${message.notification?.title}');
  }
  // TODO: Implement navigation or other actions based on message.data
  // Example: if (message.data['navigateTo'] == 'explanationScreen') {
  //   // MyApp.navigatorKey.currentState?.pushNamed('explanation'); // If using a global key
  // }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ApodProvider(),
            lazy: true,
          ),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Space Information",
            initialRoute: 'Start',
            routes: {
              'Start': (context) => const SplashScreen(),
              'next_page': (context) => const EntryScreen(),
              'explanation': (context) => const ExplanationPage(),
              '/upcomingMission': (context) => const UpcomingMissionPage(),
              '/PastMission': (context) => const UpcomingMissionPage(),
              '/rocketDetails': (context) => const RocketDetails(),
            },
          );
        });
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NotificationServices notificationServices=NotificationServices();

  @override
  void initState() {
   // notificationServices.requestNotificationPermission();
    // notificationServices.isTokenRefershed();
    // notificationServices.getToken();
   // initializeLocalNotifications();
    notificationServices.getToken().then((value) {
      print("token");
      print(value);
    });
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pop(context);
      Navigator.pushNamed(context, 'next_page');
    });

    super.initState();
    notificationServices.getToken().then((value) {
      print("Splash Screen - FCM Token: $value");
    });

    // The rest of your SplashScreen logic
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) { // Check if the widget is still in the tree
        Navigator.pop(context);
        Navigator.pushNamed(context, 'next_page');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Backcolor,
      body: Center(
        child: Lottie.asset('assets/animation/space.json'),
      ),
    );
  }
}
