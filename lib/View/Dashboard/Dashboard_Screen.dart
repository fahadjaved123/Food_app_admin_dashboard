import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashboard_desktop.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashboard_mobile.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashboard_tablet.dart';
import 'package:food_app_adminpanel/View/Responsive/Responsive_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsivepage(
      mobileScaffload: DashboardMobile(),
      TabletScaffload: DashboardTablet(),
      desktopScaffload: DashboardDesktop(),
    );
  }
  
}
