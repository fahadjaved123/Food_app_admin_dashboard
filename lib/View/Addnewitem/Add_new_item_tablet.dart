import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Addnewitem/Add_new_item_content.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashborad_Data.dart';
import 'package:food_app_adminpanel/res/Components/Drawer_content.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddNewItemTablet extends StatefulWidget {
  const AddNewItemTablet({super.key});

  @override
  State<AddNewItemTablet> createState() => _AddNewItemTabletState();
}

class _AddNewItemTabletState extends State<AddNewItemTablet> {
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
      body: NewItemContent(
        mainwidth: 200,
        mwidth: 120,
      ),
    );
  }
}
