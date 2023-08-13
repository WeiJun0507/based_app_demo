import 'package:based_app/home/home_screen.dart';
import 'package:based_app/login/login_screen.dart';
import 'package:based_app/manager/object_mgr.dart';
import 'package:based_app/util/color.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';

final ObjectMgr objectMgr = ObjectMgr();

void main() {
  runApp(const MyApp());
  // pk_live_83F940D75722035D
  Magic.instance = Magic("pk_live_4C3FACD91C3B73E6");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorPlate.primaryColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: Stack(
        children: <Widget>[
          const SplashScreen(),
          Magic.instance.relayer,
        ],
      ),
    );
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
    super.initState();
    objectMgr.init().then((_) {
      if (objectMgr.userMgr.isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPlate.black,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/images/logo_text.jpeg',
          ),
        ),
      ),
    );
  }
}
