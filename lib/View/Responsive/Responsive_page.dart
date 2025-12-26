import 'package:flutter/material.dart';

class Responsivepage extends StatefulWidget {
  final Widget mobileScaffload;
  final Widget desktopScaffload;
  final Widget TabletScaffload;
  const Responsivepage(
      {super.key,
      required this.TabletScaffload,
      required this.desktopScaffload,
      required this.mobileScaffload});

  @override
  State<Responsivepage> createState() => _ResponsivepageState();
}

class _ResponsivepageState extends State<Responsivepage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // desktop
        if (constraints.maxWidth < 600) {
          return widget.mobileScaffload;
        }

        // mobile
        else if (constraints.maxWidth < 1100) {
          return widget.TabletScaffload;
        } else {
          return widget.desktopScaffload;
        }
      },
    );
  }
}
