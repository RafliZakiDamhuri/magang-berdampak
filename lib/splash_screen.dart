import 'package:flutter/material.dart';
import 'package:magang_3/page1.dart';
import 'package:magang_3/page2.dart';
import 'package:magang_3/page3.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pindahKeHomePage();
    });
  }

  Future<void> pindahKeHomePage() async {
    {
      await Future.delayed(Duration(seconds: 3));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Page1();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(width: 200, height: 200, child: Text('Next')),
        ),
      ),
    );
  }
}
