import 'package:flutter/material.dart';
import 'responsive_media_query.dart';

Route createRoute({Offset begin = const Offset(1.0, 0.0), Offset end = Offset.zero, Curve curve = Curves.ease, Widget query = const InitialRouteQuery()}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => query,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}