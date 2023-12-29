import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_animation_getx_local/screens/quiz/quiz_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:websafe_svg/websafe_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizScreen(),
        // '/second': (context) => const secondRoute(),
      },
    );
  }
}
