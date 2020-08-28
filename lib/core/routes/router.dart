import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:fps/features/addProduct/presentation/pages/add_product_screen.dart';
import 'package:fps/features/allProducts/presentation/pages/all_product_screen.dart';
import 'package:fps/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:fps/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:fps/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:fps/features/getStarted/get_started_screen.dart';
import 'package:fps/features/scanProduct/presentation/pages/scan_product_screen.dart';
import 'package:fps/features/splash/splash_screen.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    AdaptiveRoute(page: SplashScreen, initial: true),
    CustomRoute(
      page: GetStartedScreen,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: AddProductScreen,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: AllProductScreen,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: SignInScreen,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: SignUpScreen,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: DashboardScreen,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
    CustomRoute(
      page: ScanProductScreen,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
  ],
)
class $Router {}
