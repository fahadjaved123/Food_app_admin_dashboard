import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Addnewitem/Add_new_item.dart';
import 'package:food_app_adminpanel/res/Components/Drawer_content.dart';
import 'package:food_app_adminpanel/res/Components/Orders_widget.dart';
import 'package:food_app_adminpanel/res/Components/Row_content.dart';
import 'package:food_app_adminpanel/res/Components/Sales_chart.dart';
import 'package:food_app_adminpanel/res/Components/Total_revenue_chart.dart';
import 'package:food_app_adminpanel/res/Components/enum.dart';
import 'package:iconsax/iconsax.dart';

class MobileViewo extends StatefulWidget {
  const MobileViewo({super.key});

  @override
  State<MobileViewo> createState() => _MobileViewoState();
}

class _MobileViewoState extends State<MobileViewo> {
  int selectedIndex = 0;
  TextEditingController searchcont = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
        ),
        drawer: Drawer(
          child: DrawerContent(
            selectedIndex: selectedIndex,
            onItemSelected: _onMenuTap,
          ),
        ),
        body: _getPage());
  }

  Widget _dashboardView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(children: [
          RowContent(
            searchcont: searchcont,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.4, // wider cards for mobile
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
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Dropdown Filter
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Order & Sales Overview",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 55,
                              child: DropdownButton<ChartFilter>(
                                value: selectedFilter,
                                underline: const SizedBox(),
                                items: const [
                                  DropdownMenuItem(
                                    value: ChartFilter.month,
                                    child: Text(
                                      "Monthly",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: ChartFilter.year,
                                    child: Text("Yearly",
                                        style: TextStyle(fontSize: 8)),
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
                      ),
                      const SizedBox(height: 10),
                      SalesOverviewChart(),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1, // right chart takes 1/3 of space
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
          const SizedBox(width: 20),
        ]),
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

  Widget _getPage() {
    switch (selectedIndex) {
      case 0:
        return _dashboardView();
      case 1:
        return AddNewItem();
      default:
        return const SizedBox();
    }
  }
}
