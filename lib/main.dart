import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'core/routes/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator.builder(
          router: Router(),
          initialRoute: '/',
          builder: (ctx, extendedNav) => extendedNav),
    );
  }
}
