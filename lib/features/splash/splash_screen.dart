import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fps/core/routes/router.gr.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    ExtendedNavigator.of(context)
        .pushAndRemoveUntil(Routes.getStartedScreen, (route) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
