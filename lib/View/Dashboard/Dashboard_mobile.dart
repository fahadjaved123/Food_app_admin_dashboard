import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashboard_content.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashborad_Data.dart';
import 'package:food_app_adminpanel/res/Components/Drawer_content.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardData controller = Get.put(DashboardData());
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey.shade200),
      drawer: Drawer(
        child: DrawerContent(
          selectedIndex: controller.selectedIndex.value,
          onItemSelected: controller.onMenuTap,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: DashboardContent(
          childAspectRatio: 2,
          gridCount: 2,
          showSidebar: false,
        ),
      ),
    );
  }
}
