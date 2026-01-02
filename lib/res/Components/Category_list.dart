import 'package:food_app_adminpanel/res/Components/Categaory.dart';

class CategoryList {
  static const pizza =
      Categaory(iconData: 'assets/images/pizza.png', name: "Pizza");
  static const Burger =
      Categaory(iconData: "assets/images/burger.png", name: "Burger");
  static const Drinks =
      Categaory(iconData: "assets/images/drinks.png", name: "Drinks");

  static const desert =
      Categaory(iconData: "assets/images/desert.png", name: "Desserts");
  static const List<Categaory> catelist = [pizza, Burger, Drinks, desert];
}
