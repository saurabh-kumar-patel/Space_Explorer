import 'package:apod/pages/main_screen_page.dart';
import 'package:apod/provider/isro_provider/launcher_provider.dart';
import 'package:apod/provider/isro_provider/spacecraft_provider.dart';
import 'package:apod/provider/isro_provider/upcoming_mission_provider.dart';
import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:apod/pages/explanation_page.dart';
import 'package:apod/pages/home_page.dart';
import 'package:apod/provider/apod_provider.dart';

void main() async {
  runApp(const MyApp());
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
          ChangeNotifierProvider(
            create: (_) => SpacecraftProvider(),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => LauncherProvider(),
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
              'next_page':(context) => HomePage(),
              'explanation': (context) => const ExplanationPage(),
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

  @override
  void initState() {
    Future.delayed( const Duration(seconds: 5),(){
      Navigator.pop(context);
      Navigator.pushNamed(context,'next_page');

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Backcolor,
      body:Center(child: Lottie.asset('assets/animation/space.json'),),
    );
  }
}

