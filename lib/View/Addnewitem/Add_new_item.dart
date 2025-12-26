import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Addnewitem/Add_new_item_desktop.dart';
import 'package:food_app_adminpanel/View/Addnewitem/Add_new_item_mobile.dart';
import 'package:food_app_adminpanel/View/Addnewitem/Add_new_item_tablet.dart';
import 'package:food_app_adminpanel/View/Responsive/Responsive_page.dart';

class AddNewItem extends StatelessWidget {
  const AddNewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsivepage(
        TabletScaffload: AddNewItemTablet(),
        desktopScaffload: AddNewItemDesktop(),
        mobileScaffload: AddNewItemMobile());
  }
}
