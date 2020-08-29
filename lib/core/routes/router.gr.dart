// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/addProduct/presentation/pages/add_product_screen.dart';
import '../../features/allProducts/presentation/pages/all_product_screen.dart';
import '../../features/auth/presentation/pages/sign_in_screen.dart';
import '../../features/auth/presentation/pages/sign_up_screen.dart';
import '../../features/dashboard/presentation/pages/dashboard_screen.dart';
import '../../features/getStarted/get_started_screen.dart';
import '../../features/scanProduct/presentation/pages/scan_product_screen.dart';
import '../../features/splash/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String getStartedScreen = '/get-started-screen';
  static const String addProductScreen = '/add-product-screen';
  static const String allProductScreen = '/all-product-screen';
  static const String signInScreen = '/sign-in-screen';
  static const String signUpScreen = '/sign-up-screen';
  static const String dashboardScreen = '/dashboard-screen';
  static const String scanProductScreen = '/scan-product-screen';
  static const all = <String>{
    splashScreen,
    getStartedScreen,
    addProductScreen,
    allProductScreen,
    signInScreen,
    signUpScreen,
    dashboardScreen,
    scanProductScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.getStartedScreen, page: GetStartedScreen),
    RouteDef(Routes.addProductScreen, page: AddProductScreen),
    RouteDef(Routes.allProductScreen, page: AllProductScreen),
    RouteDef(Routes.signInScreen, page: SignInScreen),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.dashboardScreen, page: DashboardScreen),
    RouteDef(Routes.scanProductScreen, page: ScanProductScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    GetStartedScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            GetStartedScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
    AddProductScreen: (data) {
      final args = data.getArgs<AddProductScreenArguments>(
        orElse: () => AddProductScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddProductScreen(key: args.key),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
    AllProductScreen: (data) {
      final args = data.getArgs<AllProductScreenArguments>(
        orElse: () => AllProductScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AllProductScreen(key: args.key),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
    SignInScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
    SignUpScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SignUpScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
    DashboardScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DashboardScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
    ScanProductScreen: (data) {
      final args = data.getArgs<ScanProductScreenArguments>(
        orElse: () => ScanProductScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ScanProductScreen(key: args.key),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashScreen() => push<dynamic>(Routes.splashScreen);

  Future<dynamic> pushGetStartedScreen() =>
      push<dynamic>(Routes.getStartedScreen);

  Future<dynamic> pushAddProductScreen({
    Key key,
  }) =>
      push<dynamic>(
        Routes.addProductScreen,
        arguments: AddProductScreenArguments(key: key),
      );

  Future<dynamic> pushAllProductScreen({
    Key key,
  }) =>
      push<dynamic>(
        Routes.allProductScreen,
        arguments: AllProductScreenArguments(key: key),
      );

  Future<dynamic> pushSignInScreen() => push<dynamic>(Routes.signInScreen);

  Future<dynamic> pushSignUpScreen() => push<dynamic>(Routes.signUpScreen);

  Future<dynamic> pushDashboardScreen() =>
      push<dynamic>(Routes.dashboardScreen);

  Future<dynamic> pushScanProductScreen({
    Key key,
  }) =>
      push<dynamic>(
        Routes.scanProductScreen,
        arguments: ScanProductScreenArguments(key: key),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AddProductScreen arguments holder class
class AddProductScreenArguments {
  final Key key;
  AddProductScreenArguments({this.key});
}

/// AllProductScreen arguments holder class
class AllProductScreenArguments {
  final Key key;
  AllProductScreenArguments({this.key});
}

/// ScanProductScreen arguments holder class
class ScanProductScreenArguments {
  final Key key;
  ScanProductScreenArguments({this.key});
}
