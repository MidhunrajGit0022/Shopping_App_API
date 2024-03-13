import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main() => runApp(const Amazon());

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
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
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Homepage()))
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
              nextScreen: const Homepage(),
              splashTransition: SplashTransition.scaleTransition,
              duration: 1000,
            ),
          ),
        ],
      )),
    );
  }
}
