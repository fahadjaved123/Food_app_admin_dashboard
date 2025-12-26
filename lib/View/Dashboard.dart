import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Addnewitem/Add_new_item.dart';
import 'package:food_app_adminpanel/res/Components/Drawer_content.dart';
import 'package:food_app_adminpanel/res/Components/My_textfield.dart';
import 'package:food_app_adminpanel/res/Components/Orders_widget.dart';
import 'package:food_app_adminpanel/res/Components/Row_content.dart';
import 'package:food_app_adminpanel/res/Components/Sales_chart.dart';
import 'package:food_app_adminpanel/res/Components/Total_revenue_chart.dart';
import 'package:food_app_adminpanel/res/Components/enum.dart';
import 'package:iconsax/iconsax.dart';

class DashBoardView extends StatefulWidget {
  final isDesktop;
  final ismobile;
  const DashBoardView(
      {super.key, required this.isDesktop, required this.ismobile});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int selectedIndex = 0;
  TextEditingController searchcont = TextEditingController();
  List<Map<String, dynamic>> listm = [
    {
      'Customer name': "Jane Deo",
      'Order Id': "#2024",
      'Store Name': "Super In",
      'Order Time': "03:45pm",
      'Status': "pending",
      'ETA': "06:40pm",
    }
  ];
  @override
  Widget build(BuildContext context) {
    // final isDesktop = MediaQuery.of(context).size.width > 600;
    ChartFilter selectedFilter = ChartFilter.month;

    return Scaffold(
      appBar: widget.isDesktop
          ? null // Desktop may not need AppBar or can have a custom one
          : AppBar(),
      drawer: widget.isDesktop
          ? null
          : Drawer(
              child: DrawerContent(
                selectedIndex: selectedIndex,
                onItemSelected: _onMenuTap,
              ),
            ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            // getpage(selectedIndex),
            // Sidebar for Desktop
            if (widget.isDesktop)
              Container(
                width: 200,
                color: Colors.grey.shade100,
                child: DrawerContent(
                  selectedIndex: selectedIndex,
                  onItemSelected: _onMenuTap,
                ),
              ),

            // Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Top Row
                      RowContent(
                        searchcont: searchcont,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      ///
                      /// ORder widget
                      ///
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isMobile = constraints.maxWidth < 600;
                          return Wrap(
                            children: [
                              _responsiveItem(
                                isMobile,
                                OrdersWidget(
                                  iconData: Iconsax.activity,
                                  maintext: "Total Orders",
                                  text: "20",
                                ),
                              ),
                              _responsiveItem(
                                isMobile,
                                OrdersWidget(
                                  iconData: Iconsax.activity,
                                  maintext: "Revenue",
                                  text: "\$200",
                                ),
                              ),
                              _responsiveItem(
                                isMobile,
                                OrdersWidget(
                                  iconData: Iconsax.activity,
                                  maintext: "Active Deliveries",
                                  text: "15",
                                ),
                              ),
                              _responsiveItem(
                                isMobile,
                                OrdersWidget(
                                  iconData: Iconsax.activity,
                                  maintext: "New Customers",
                                  text: "15",
                                ),
                              )
                            ],
                          );
                        },
                      ),

                      ///
                      /// Chart
                      ///
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2, // left chart takes 2/3 of space
                            child: Container(
                              height: 550,
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
                                        horizontal: 20, vertical: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Order & Sales Overview",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: DropdownButton<ChartFilter>(
                                            value: selectedFilter,
                                            underline: const SizedBox(),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: const [
                                              DropdownMenuItem(
                                                value: ChartFilter.month,
                                                child: Text(
                                                  "Monthly",
                                                  style: TextStyle(fontSize: 8),
                                                ),
                                              ),
                                              DropdownMenuItem(
                                                value: ChartFilter.year,
                                                child: Text("Yearly",
                                                    style:
                                                        TextStyle(fontSize: 8)),
                                              ),
                                            ],
                                            onChanged: (value) {
                                              if (value != null) {
                                                setState(() =>
                                                    selectedFilter = value);
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
                              height: 400,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "List of Orders",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Table(
                                defaultColumnWidth: const FlexColumnWidth(),
                                border: TableBorder.all(
                                  color: Theme.of(context).dividerColor,
                                  style: BorderStyle.solid,
                                  width: 1,
                                ),
                                children: [
                                  TableRow(children: [
                                    buildTableHead(
                                        "Customer Name", 15, FontWeight.bold),
                                    buildTableHead(
                                        "Order ID", 15, FontWeight.bold),
                                    buildTableHead(
                                        "Store Name", 15, FontWeight.bold),
                                    buildTableHead(
                                        "Order Time", 15, FontWeight.bold),
                                    buildTableHead(
                                        "Status", 15, FontWeight.bold),
                                    buildTableHead("ETA", 15, FontWeight.bold),
                                  ]),
                                  ...listm.map((e) {
                                    return TableRow(children: [
                                      buildTablecell(e['Customer name'], 10,
                                          FontWeight.w400),
                                      buildTablecell(
                                          e['Order Id'], 10, FontWeight.w400),
                                      buildTablecell(
                                          e['Store Name'], 10, FontWeight.w400),
                                      buildTablecell(
                                          e['Order Time'], 10, FontWeight.w400),
                                      buildTablecell(
                                          e['Status'], 10, FontWeight.w400),
                                      buildTablecell(
                                          e['ETA'], 10, FontWeight.w400),
                                    ]);
                                  })
                                ],
                              )
                            ],
                          )),
                      Text(_getPageTitle(selectedIndex)),
                    ],
                  ),
                ),
              ),
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

  String _getPageTitle(int index) {
    const titles = [
      "Dashboard",
      "add new item",
      "Orders",
      "Restaurants",
      "Invoices",
      "Sales",
      "Reports",
      "Offers",
      "Location",
      "Users",
      "Settings"
    ];
    return titles[index];
  }

  Widget getpage() {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget? page;
        switch (selectedIndex) {
          case 0:
            page = DashBoardView(
                isDesktop: widget.isDesktop, ismobile: widget.ismobile);
            break;
          case 1:
            page = AddNewItem();
        }
        return MaterialPageRoute(builder: (_) => page ?? Container());
      },
    );
  }

  Widget _responsiveItem(bool isMobile, Widget child) {
    return SizedBox(
      width: isMobile ? double.infinity / 2 : 250,
      child: child,
    );
  }
}

Widget buildTableHead(String text, double fontSize, FontWeight fontWeight,
    {TextAlign align = TextAlign.center}) {
  return TableCell(
    child: Padding(
      padding: const EdgeInsets.all(5), // Reduced padding
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}

Widget buildTablecell(String text, double fontSize, FontWeight fontWeight,
    {TextAlign align = TextAlign.center}) {
  return TableCell(
    child: Padding(
      padding: const EdgeInsets.all(5), // Reduced padding
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}
