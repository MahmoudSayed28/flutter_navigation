import 'package:flutter/material.dart';

const _defaultDuration = Duration(milliseconds: 400);

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlidePageRoute({required this.page})
    : super(
        transitionDuration: _defaultDuration,
        pageBuilder: (_, _, _) => page,
        transitionsBuilder: (_, animation, _, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          );

          final offsetAnimation = Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(curved);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
}

class ScalePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  ScalePageRoute({required this.page})
    : super(
        transitionDuration: _defaultDuration,
        pageBuilder: (_, _, _) => page,
        transitionsBuilder: (_, animation, _, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          );

          final scaleAnimation = Tween<double>(
            begin: 0,
            end: 1,
          ).animate(curved);

          return ScaleTransition(scale: scaleAnimation, child: child);
        },
      );
}

class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadePageRoute({required this.page})
    : super(
        transitionDuration: _defaultDuration,
        pageBuilder: (_, _, _) => page,
        transitionsBuilder: (_, animation, _, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );

          return FadeTransition(opacity: curved, child: child);
        },
      );
}

class SizeFadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  SizeFadePageRoute({required this.page})
    : super(
        transitionDuration: _defaultDuration,
        pageBuilder: (_, _, _) => page,
        transitionsBuilder: (_, animation, _, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          );

          return Align(
            alignment: Alignment.center,
            child: SizeTransition(
              sizeFactor: curved,
              axisAlignment: -1,
              child: FadeTransition(opacity: curved, child: child),
            ),
          );
        },
      );
}

class ScaleRotatePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  ScaleRotatePageRoute({required this.page})
    : super(
        transitionDuration: _defaultDuration,
        pageBuilder: (_, _, _) => page,
        transitionsBuilder: (_, animation, _, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          );

          final scaleAnimation = Tween<double>(
            begin: 0.7,
            end: 1,
          ).animate(curved);

          final rotateAnimation = Tween<double>(
            begin: -0.1,
            end: 0,
          ).animate(curved);

          return ScaleTransition(
            scale: scaleAnimation,
            child: RotationTransition(turns: rotateAnimation, child: child),
          );
        },
      );
}
