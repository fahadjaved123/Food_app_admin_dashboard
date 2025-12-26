import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashborad_Data.dart';
import 'package:food_app_adminpanel/res/Components/Drawer_content.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddNewItemMobile extends StatefulWidget {
  const AddNewItemMobile({super.key});

  @override
  State<AddNewItemMobile> createState() => _AddNewItemMobileState();
}

class _AddNewItemMobileState extends State<AddNewItemMobile> {
  final DashboardData controller = Get.put(DashboardData());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey.shade200),
      drawer: Drawer(
        child: DrawerContent(
          selectedIndex: controller.selectedIndex.value,
          onItemSelected: controller.onMenuTap,
        ),
      ),
      body: Column(
        children: [
          Text(
            "Add New Item",
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}
