import 'package:flutter/material.dart';

abstract class ConstantsAnimation {
  static Widget sliverListAnimation(
      BuildContext context, Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        child: child,
      ),
    );
  }
}
