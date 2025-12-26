import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Selectcatorgy/Item_details.dart';

class SelectCategory extends StatelessWidget {
  final List<String> categories = ['Pizza', 'Burger', 'Drinks', 'Desserts'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categories[index]),
          onTap: () {
            // Navigate to add details screen with selected category
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddItemDetails(category: categories[index]),
              ),
            );
          },
        );
      },
    );
  }
}
