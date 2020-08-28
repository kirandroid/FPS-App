import 'package:flutter/material.dart';
import 'package:fps/home.dart';
import 'package:fps/features/getStarted/loadingScreen.dart';
import 'package:fps/scanProduct.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
