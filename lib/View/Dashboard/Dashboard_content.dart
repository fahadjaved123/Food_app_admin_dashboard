import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashborad_Data.dart';
import 'package:food_app_adminpanel/res/Components/Card_widget.dart';
import 'package:food_app_adminpanel/res/Components/Orders_widget.dart';
import 'package:food_app_adminpanel/res/Components/Row_content.dart';
import 'package:food_app_adminpanel/res/Components/Sales_chart.dart';
import 'package:food_app_adminpanel/res/Components/Total_revenue_chart.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DashboardContent extends StatelessWidget {
  final int gridCount;
  final bool showSidebar;
  final childAspectRatio;
  const DashboardContent({
    super.key,
    required this.childAspectRatio,
    required this.gridCount,
    required this.showSidebar,
  });

  @override
  Widget build(BuildContext context) {
    final DashboardData controller = Get.put(DashboardData());
    return Column(
      children: [
        RowContent(searchcont: DashboardData.searchController),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: DashboardData.ordersData.length,
          itemBuilder: (context, index) {
            final item = DashboardData.ordersData[index];
            return OrdersWidget(
              iconData: item['icon'],
              maintext: item['title'],
              text: item['value'],
            );
          },
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Expanded(
              child: CardWidget(
                title: "Order & Sales Overview",
                dropdown: true,
                child: SalesOverviewChart(),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CardWidget(
                title: "Total Revenue",
                child: TotalRevenueChart(
                  revenueData: [1000, 1500, 1100, 1200, 2000],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
