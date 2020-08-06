import 'package:flutter/material.dart';
import 'package:afaq/ui/auth/tabauth_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TabAuthPage()),
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }
}
