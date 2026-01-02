import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/res/Components/Category_list.dart';

class CategoryWidget extends StatelessWidget {
  final pageController;
  final void Function(String value)? onTap;
  CategoryWidget(
      {super.key, required this.pageController, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      itemCount: CategoryList.catelist.length,
      itemBuilder: (context, index) {
        final e = CategoryList.catelist[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              onTap!(e.name); // move to images page
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(
                        color: Colors.grey.shade500.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(e.iconData, fit: BoxFit.cover),
                  ),
                ),
                title: Text(
                  e.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    size: 14, color: Colors.grey),
              ),
            ),
          ),
        );
      },
    );
  }
}
