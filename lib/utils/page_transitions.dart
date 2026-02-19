import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PageTransitionType {
  leftToRight,
  rightToLeft,
  defaults,
  fadeOut,
  bottomToTop,
}

class PageTransitions {
  static CustomTransitionPage buildTransition({
    required Widget page,
    required PageTransitionType type,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (type) {
          case PageTransitionType.leftToRight:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case PageTransitionType.rightToLeft:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case PageTransitionType.bottomToTop:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case PageTransitionType.defaults:
            return child;
          default:
            return child;
        }
      },
    );
  }
}
