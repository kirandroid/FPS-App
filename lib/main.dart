import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fps/features/userScreen.dart';
import 'package:fps/injection.dart';
import 'package:injectable/injectable.dart';
import 'core/routes/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureInjection(Environment.prod);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: UserScreen(),
      builder: ExtendedNavigator.builder(
          router: Router(),
          initialRoute: '/',
          builder: (ctx, extendedNav) => extendedNav),
    );
  }
}
