import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../views/screens/home/home_screen.dart';

Route generateRoute(RouteSettings routeSettings) {
  final args = routeSettings.arguments;

  switch (routeSettings.name) {
    case '/':
      return pageRoute(HomeScreen());
    case '/main':
      return pageRoute(HomeScreen());
  }

  return generateRoute(routeSettings);
}

Route pageRoute(Widget child) {
  return PageRouteBuilder<void>(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SharedAxisTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        transitionType: SharedAxisTransitionType.scaled,
        child: child,
      );
    },
  );
}
