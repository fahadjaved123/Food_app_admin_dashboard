import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashboard_content.dart';

class DashboardTablet extends StatelessWidget {
  const DashboardTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey.shade200),
      drawer: Drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: DashboardContent(
          childAspectRatio: 1.5,
          gridCount: 3,
          showSidebar: false,
        ),
      ),
    );
  }
}
