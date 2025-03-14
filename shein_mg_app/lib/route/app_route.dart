import 'package:flutter/material.dart';
import 'package:shein_mg_app/presentation/detailsArt/widget/details_art.dart';
import 'package:shein_mg_app/presentation/home.dart';
import 'package:shein_mg_app/route/app_route_name.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.home:
        return MaterialPageRoute(
            builder: (_) => const Home(), settings: settings);

      case AppRouteName.detailsArt:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailsArt(),
          transitionDuration: const Duration(milliseconds: 550),
          reverseTransitionDuration: const Duration(milliseconds: 550),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
    }
    return null;
  }
}
