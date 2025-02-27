import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasePageWidget extends StatelessWidget {
  final Widget child;
  final SystemUiOverlayStyle overlayStyle;

  const BasePageWidget(
      {super.key,
      required this.child,
      this.overlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      )});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: child,
    );
  }
}
