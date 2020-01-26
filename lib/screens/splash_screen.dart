import 'package:flutter/material.dart';
import 'package:volume/screens/home_screen.dart';
import '../common/styles.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _splashData();
    super.initState();
  }

  Future<void> _splashData() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (ctx) => HomeScreen(
                  title: 'Crypto Price',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlackColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 150,
              ),
              RichText(
                text: TextSpan(
                    text: 'THE ',
                    style: TextStyle(fontSize: 17),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'VOLUME ', style: TextStyle(color: greenColor)),
                      TextSpan(text: 'APP'),
                    ]),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Your best friend".toUpperCase(),
                style: TextStyle(
                    color: Colors.white.withOpacity(0.25), fontSize: 13),
              ),
            ],
          ),
          // Container(width: 20, height: 20, child: ,),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: SpinKitThreeBounce(
                color: Colors.white,
                size: 15,
              )),
        ],
      )),
    );
  }
}
