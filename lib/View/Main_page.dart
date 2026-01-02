import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Addnewitem/Add_new_item.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashboard_Screen.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashborad_Data.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final DashboardData controller = Get.put(DashboardData());
  int selectedIndex = 0;
  final List<Widget> pages = [
    DashboardScreen(),
    AddNewItem(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => pages[controller.selectedIndex.value]);
  }

}