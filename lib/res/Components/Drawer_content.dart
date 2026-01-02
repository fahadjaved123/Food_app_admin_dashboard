import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Dashboard/Dashborad_Data.dart';
import 'package:food_app_adminpanel/res/Components/ListTile.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class DrawerContent extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const DrawerContent({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  final DashboardData controller = Get.put(DashboardData());

  final GlobalKey addItemKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // padding: EdgeInsets.only(top: 10),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: const Text(
              'Food Hack',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              thickness: 2,
            ),
          ),
          Obx(() {
            return AnimatedContainer(
              width: controller.isExpanded.value ? 220 : 120,
              duration: Duration(microseconds: 200),
              child: Column(
                children: [
                  Mylisttile(
                    isExpanded: controller.isExpanded.value,
                    icon: Iconsax.category,
                    text: 'Dashboard',
                    isSelected: widget.selectedIndex == 0,
                    onTap: () => widget.onItemSelected(0),
                  ),
                  Mylisttile(
                      key: addItemKey,
                      isExpanded: controller.isExpanded.value,
                      icon: Iconsax.add,
                      text: 'Add new Item',
                      isSelected: widget.selectedIndex == 1,
                      onTap: () {
//showCategoriesOverlay(addItemKey);
                        widget.onItemSelected(1);
                      }),
                  Mylisttile(
                    isExpanded: controller.isExpanded.value,
                    icon: Iconsax.menu_board,
                    text: 'Menu',
                    isSelected: widget.selectedIndex == 2,
                    onTap: () => widget.onItemSelected(2),
                  ),
                  Mylisttile(
                    isExpanded: controller.isExpanded.value,
                    icon: Iconsax.reserve,
                    text: 'Restaurant List',
                    isSelected: widget.selectedIndex == 3,
                    onTap: () => widget.onItemSelected(3),
                  ),
                  Mylisttile(
                    isExpanded: controller.isExpanded.value,
                    icon: Iconsax.people,
                    text: 'Customers',
                    isSelected: widget.selectedIndex == 4,
                    onTap: () => widget.onItemSelected(4),
                  ),
                  Mylisttile(
                    isExpanded: controller.isExpanded.value,
                    icon: Iconsax.graph,
                    text: 'Sales',
                    isSelected: widget.selectedIndex == 5,
                    onTap: () => widget.onItemSelected(5),
                  ),
                  Mylisttile(
                    isExpanded: controller.isExpanded.value,
                    icon: Iconsax.document_1,
                    text: 'Reports',
                    isSelected: widget.selectedIndex == 6,
                    onTap: () => widget.onItemSelected(6),
                  ),
                  Mylisttile(
                    isExpanded: controller.isExpanded.value,
                    icon: Iconsax.tag,
                    text: 'Offers',
                    isSelected: widget.selectedIndex == 8,
                    onTap: () => widget.onItemSelected(8),
                  ),
                  Mylisttile(
                    isExpanded: controller.isExpanded.value,
                    icon: Iconsax.location,
                    text: 'Location',
                    isSelected: widget.selectedIndex == 9,
                    onTap: () => widget.onItemSelected(9),
                  ),
                  Mylisttile(
                    isExpanded: controller.isExpanded.value,
                    icon: Iconsax.setting,
                    text: 'Setting',
                    isSelected: widget.selectedIndex == 10,
                    onTap: () => widget.onItemSelected(10),
                  ),
                  GestureDetector(
                      onTap: () {
                        controller.changemenuState();
                      },
                      child: AnimatedRotation(
                        turns: controller.isExpanded.value
                            ? 0.5
                            : 0, // Rotate 180° when expanded
                        duration: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Icon(
                              Iconsax.arrow_right,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  // OverlayEntry? overlayEntry;
  // bool isOverlayVisible = false;
  // final List<String> categories = ['Pizza', 'Burger', 'Drinks', 'Desserts'];
  // final List<IconData> icon = [
  //   Icons.local_pizza,
  //   Icons.fastfood,
  //   Icons.local_drink,
  //   Icons.cake,
  // ];

  // void showCategoriesOverlay(dynamic addItemKey) {
  //   if (isOverlayVisible) {
  //     overlayEntry?.remove();
  //     overlayEntry = null;
  //     isOverlayVisible = false;
  //   } else {
  //     final renderBox =
  //         addItemKey.currentContext!.findRenderObject() as RenderBox;
  //     final offset = renderBox.localToGlobal(Offset.zero);

  //     overlayEntry = OverlayEntry(
  //       builder: (context) => Positioned(
  //         top: offset.dy + renderBox.size.height, // below button
  //         left: offset.dx + renderBox.size.width + 10, // right of drawer
  //         child: Material(
  //           elevation: 5,
  //           color: Colors.grey.shade200,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: categories.asMap().entries.map((category) {
  //               int index = category.key;
  //               String value = category.value;
  //               return Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //                 child: Mylisttile(
  //                   icon: icon[index],
  //                   text: value,
  //                   isExpanded: isExpanded,
  //                   isSelected: false,
  //                   onTap: () {
  //                     print('Selected category: $category');
  //                     overlayEntry?.remove();
  //                     widget.onItemSelected(1);
  //                     overlayEntry = null;
  //                     isOverlayVisible = false;
  //                   },
  //                 ),
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //       ),
  //     );

  //     Overlay.of(context).insert(overlayEntry!);
  //     isOverlayVisible = true;
  //   }
  // }
}
