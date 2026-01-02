import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/Controllers/Add_item_controller.dart';
import 'package:food_app_adminpanel/View_Model/Add_new_item_VM.dart';
import 'package:food_app_adminpanel/res/Components/Add_images.dart';
import 'package:food_app_adminpanel/res/Components/Add_item_name.dart';
import 'package:food_app_adminpanel/res/Components/Category_widget.dart';
import 'package:food_app_adminpanel/res/Components/My_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NewItemContent extends StatefulWidget {
  final mainwidth;
  final mwidth;
  const NewItemContent(
      {super.key, required this.mainwidth, required this.mwidth});

  @override
  State<NewItemContent> createState() => _NewItemContentState();
}

class _NewItemContentState extends State<NewItemContent> {
  final additemVM = AddItemViewModel();
  final controller = Get.put(AddItemController());
  final PageController pageController = PageController();
  int currentindex = 0;
  TextEditingController name = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController price = TextEditingController();
  String valu = '';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                      const Icon(Iconsax.add, color: Colors.orange, size: 20),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Add New Item",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 0),
            Text(
              currentindex == 1 ? "Upload Images" : "Select Category",
              style: TextStyle(color: Colors.grey),
            ),
            // Progress Indicator
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (dotIndex) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 10),
                      height: 8,
                      width: additemVM.currentindex.value == dotIndex
                          ? widget.mainwidth
                          : widget.mwidth,
                      decoration: BoxDecoration(
                        color: additemVM.currentindex.value == dotIndex
                            ? Colors.deepPurple
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //PageView (takes remaining space)

            Expanded(
              child: PageView(
                controller: pageController,
                physics: const AlwaysScrollableScrollPhysics(),
                onPageChanged: (index) =>
                    setState(() => additemVM.currentindex.value = index),
                children: [
                  // Step 1: Category Selection
                  CategoryWidget(
                    onTap: (value) {
                      print(value);
                      setState(() {
                        valu = value;
                      });
                    },
                    pageController: pageController,
                  ), // ListView handles scrolling + layout

                  // Step 2: Image upload
                  AddImages(
                    value: valu,
                  ),

                  // Step 3: Add Item form
                  AddItemName(
                    des: des,
                    name: name,
                    price: price,
                    nameico: Iconsax.people,
                    desico: Iconsax.activity,
                    priceico: Iconsax.money,
                  ),
                  itemadded(),
                ],
              ),
            ),
            // Outside PageView, at bottom of screen
            additemVM.currentindex.value != 0 &&
                    additemVM.currentindex.value != 3
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Mybutton(
                            onPressed: () {
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            text: const Text("Back",
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(width: 12),
                          Mybutton(
                            isloading: additemVM.isLoading.value,
                            onPressed: () async {
                              if (additemVM.currentindex.value == 2) {
                                await additemVM.addItem(
                                    name: name.text,
                                    category: valu,
                                    price: price.text,
                                    imageName:
                                        controller.imageName.value.isNotEmpty
                                            ? controller.imageName.value
                                            : null,
                                    imageBytes: controller.imageBytes.value);
                              } else {
                                pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            text: additemVM.currentindex.value == 2
                                ? const Text("Upload",
                                    style: TextStyle(color: Colors.white))
                                : const Text("Next",
                                    style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      );
                    }),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget itemadded() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Item is Add Successfully",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Iconsax.shield_tick,
              color: Colors.green.shade500,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Mybutton(
            onPressed: () {
              pageController.animateToPage(0,
                  duration: Duration(milliseconds: 20),
                  curve: Curves.bounceInOut);
            },
            text: Text(
              "TO Back",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))
      ],
    );
  }
}
