import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  void checkCurrentUser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get();

      if (userDoc.get("verified") == true) {
        ExtendedNavigator.of(context)
            .pushAndRemoveUntil(Routes.dashboardScreen, (route) => false);
      } else {
        ExtendedNavigator.of(context)
            .pushAndRemoveUntil(Routes.getStartedScreen, (route) => false);
      }
    } else {
      ExtendedNavigator.of(context)
          .pushAndRemoveUntil(Routes.getStartedScreen, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: UIColors.primaryBackground,
    );
  }
}
