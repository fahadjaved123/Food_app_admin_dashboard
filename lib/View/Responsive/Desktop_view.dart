import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/res/Components/Card_widget.dart';
import 'package:food_app_adminpanel/res/Components/Drawer_content.dart';
import 'package:food_app_adminpanel/res/Components/Orders_widget.dart';
import 'package:food_app_adminpanel/res/Components/Row_content.dart';
import 'package:food_app_adminpanel/res/Components/Sales_chart.dart';
import 'package:food_app_adminpanel/res/Components/Total_revenue_chart.dart';
import 'package:food_app_adminpanel/res/Components/enum.dart';
import 'package:iconsax/iconsax.dart';

class DesktopViewo extends StatefulWidget {
  const DesktopViewo({super.key});

  @override
  State<DesktopViewo> createState() => _DesktopViewoState();
}

int selectedIndex = 0;
final List<Map<String, dynamic>> ordersData = [
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
TextEditingController searchcont = TextEditingController();
ChartFilter selectedFilter = ChartFilter.month;

class _DesktopViewoState extends State<DesktopViewo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 200,
            color: Colors.grey.shade200,
            child: DrawerContent(
              selectedIndex: selectedIndex,
              onItemSelected: _onMenuTap,
            ),
          ),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  RowContent(searchcont: searchcont),
                  const SizedBox(height: 16),

                  // Stats Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2,
                    ),
                    itemCount: ordersData.length,
                    itemBuilder: (context, index) {
                      final item = ordersData[index];
                      return OrdersWidget(
                        iconData: item['icon'],
                        maintext: item['title'],
                        text: item['value'],
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Charts Row
                  const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CardWidget(
                          child: SalesOverviewChart(),
                          title: "Order & Sales Overview",
                          dropdown: true,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          flex: 1,
                          child: CardWidget(
                            child: TotalRevenueChart(
                              revenueData: [1000, 1500, 1100, 1200, 2000],
                            ),
                            title: "Total Revenue",
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMenuTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
