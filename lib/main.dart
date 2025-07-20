import 'package:flutter/material.dart';
import 'package:magang_3/Providers/page1_provider.dart';
import 'package:magang_3/Providers/page3_provider.dart';
import 'package:magang_3/page1.dart';
import 'package:magang_3/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Page1Provider>(
          create: (context) => Page1Provider(),
        ),
        ChangeNotifierProvider<Page3Provider>(
          create: (context) => Page3Provider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     pindahKeHomePage();
  //   });
  // }
  // This widget is the root of your application.
  // Future<void> pindahKeHomePage() async {
  //   {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return Page1();
  //         },
  //       ),
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}
