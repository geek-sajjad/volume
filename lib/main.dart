import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:volume/screens/splash_screen.dart';

import './common/styles.dart';
import 'services/api_service.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volume',
      theme: ThemeData(
        primaryColor: mainBlackColor,
        accentColor: acentBlackColor,
        textTheme: TextTheme(
          title: TextStyle(fontSize: 15, color: mainBlackColor),
        )
      ),
      // home: MyHomePage(title: ''),
      home: SplashScreen(),
    );
  }
}

