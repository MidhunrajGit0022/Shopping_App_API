import 'package:amazonclone/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Amazon());

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      theme: ThemeData(useMaterial3: false),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000)).then((value) => {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const BottomNavigationBarExampleApp()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.height,
            height: MediaQuery.of(context).size.height,
            child: AnimatedSplashScreen(
              splash: Image.asset(
                'assets/logo.png',
                height: MediaQuery.of(context).size.height / 3,
              ),
              nextScreen: const BottomNavigationBarExampleApp(),
              splashTransition: SplashTransition.fadeTransition,
              duration: 1000,
            ),
          ),
        ],
      )),
    );
  }
}
