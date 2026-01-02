import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Addnewitem/Add_new_item_content.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashborad_Data.dart';
import 'package:food_app_adminpanel/res/Components/Drawer_content.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AddNewItemDesktop extends StatefulWidget {
  const AddNewItemDesktop({super.key});

  @override
  State<AddNewItemDesktop> createState() => _AddNewItemDesktopState();
}

class _AddNewItemDesktopState extends State<AddNewItemDesktop> {
  final DashboardData controller = Get.put(DashboardData());
  @override
  Widget build(BuildContext context) {
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
              child: Column(
            children: [
              NewItemContent(
                mainwidth: 300,
                mwidth: 180,
              )
            ],
          ))
        ],
      ),
    );
  }
}
