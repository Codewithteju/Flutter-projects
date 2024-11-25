import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreenLayuout;
  final Widget webScreenLayout;
  const ResponsiveLayout(
      {super.key,
      required this.mobileScreenLayuout,
      required this.webScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return webScreenLayout;
        }
        return mobileScreenLayuout;
      },
    );
  }
}
