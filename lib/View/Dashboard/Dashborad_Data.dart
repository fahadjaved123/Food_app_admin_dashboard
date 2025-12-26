import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_app_adminpanel/res/Components/enum.dart';

class DashboardData extends GetxController {
  RxInt selectedIndex = 0.obs;
  var selectedFilter = ChartFilter.month.obs;

  static final TextEditingController searchController = TextEditingController();

  static final List<Map<String, dynamic>> ordersData = [
    {
      'icon': Iconsax.activity,
      'title': 'Total Orders',
      'value': '20',
    },
    {
      'icon': Iconsax.money,
      'title': 'Total Revenue',
      'value': '\$5,200',
    },
    {
      'icon': Iconsax.user,
      'title': 'Total Customers',
      'value': '120',
    },
    {
      'icon': Iconsax.box,
      'title': 'Pending Orders',
      'value': '8',
    },
  ];

  void onMenuTap(int index) {
    selectedIndex.value = index;
  }
}
