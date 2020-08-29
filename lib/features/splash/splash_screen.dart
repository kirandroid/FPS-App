import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fps/core/routes/router.gr.dart';
import 'package:fps/core/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkCurrentUser();
    super.initState();
  }

  void checkCurrentUser() {
    FirebaseAuth.instance.currentUser != null
        ? ExtendedNavigator.of(context)
            .pushAndRemoveUntil(Routes.dashboardScreen, (route) => false)
        : ExtendedNavigator.of(context)
            .pushAndRemoveUntil(Routes.getStartedScreen, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: UIColors.primaryBackground,
    );
  }
}
