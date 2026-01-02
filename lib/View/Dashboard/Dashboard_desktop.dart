import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashboard_content.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashborad_Data.dart';
import 'package:food_app_adminpanel/res/Components/Drawer_content.dart';
import 'package:get/get.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardData controller = Get.put(DashboardData());
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey.shade200),
      body: Row(
        children: [
          Obx(() {
            return Container(
              width: controller.isExpanded.value ? 200 : 120,
              color: Colors.grey.shade200,
              child: DrawerContent(
                selectedIndex: controller.selectedIndex.value,
                onItemSelected: controller.onMenuTap,
              ),
            );
          }),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: DashboardContent(
                childAspectRatio: 2,
                gridCount: 4,
                showSidebar: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
