import 'package:cinemax/src/features/main/home/presentation/page/home_page.dart';
import 'package:cinemax/src/features/splash_screen/presentation/page/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return _materialRoute(
          const SplashPage(),
        );
      case HomePage.routeName:
        return _materialRoute(const HomePage());
      default:
        return _materialRoute(const SplashPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(
      builder: (_) => view,
    );
  }
}
