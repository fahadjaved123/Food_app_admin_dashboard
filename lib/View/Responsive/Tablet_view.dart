import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/res/Components/Drawer_content.dart';
import 'package:food_app_adminpanel/res/Components/Orders_widget.dart';
import 'package:food_app_adminpanel/res/Components/Row_content.dart';
import 'package:food_app_adminpanel/res/Components/Sales_chart.dart';
import 'package:food_app_adminpanel/res/Components/Total_revenue_chart.dart';
import 'package:food_app_adminpanel/res/Components/enum.dart';
import 'package:iconsax/iconsax.dart';

class TabletView extends StatefulWidget {
  const TabletView({super.key});

  @override
  State<TabletView> createState() => _TabletViewState();
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
ChartFilter selectedFilter = ChartFilter.month;

class _TabletViewState extends State<TabletView> {
  int selectedIndex = 0;
  final TextEditingController searchcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      drawer: Drawer(
        child: DrawerContent(
          selectedIndex: selectedIndex,
          onItemSelected: _onMenuTap,
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Top Search Row
            RowContent(searchcont: searchcont),
            const SizedBox(height: 16),

            // Orders Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // tablet grid
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.3,
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

            const SizedBox(height: 24),

            // Sales Overview
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 320,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        // Header Row
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                "Order & Sales Overview",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              child: DropdownButton<ChartFilter>(
                                isExpanded: true,
                                value: selectedFilter,
                                underline: const SizedBox(),
                                items: const [
                                  DropdownMenuItem(
                                    value: ChartFilter.month,
                                    child: Text(
                                      "Monthly",
                                      style: TextStyle(fontSize: 9),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: ChartFilter.year,
                                    child: Text(
                                      "Yearly",
                                      style: TextStyle(fontSize: 9),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() => selectedFilter = value);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Expanded(child: SalesOverviewChart()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  // right chart takes 1/3 of space
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Text(
                            "Total Revenue",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TotalRevenueChart(
                          revenueData: [1000, 1500, 1100, 1200, 2000],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onMenuTap(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Close drawer on mobile
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
