import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/res/Components/My_textfield.dart';

class AddItemName extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController des;
  final TextEditingController price;
  final IconData nameico;
  final IconData desico;
  final IconData priceico;
  const AddItemName(
      {super.key,
      required this.des,
      required this.name,
      required this.price,
      required this.desico,
      required this.nameico,
      required this.priceico});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          const SizedBox(
          height: 10,
        ),
        Mytextfield(
          preficon: nameico,
          controller: name,
          hinttext: "Enter Item Name",
        ),
        const SizedBox(
          height: 10,
        ),
        Mytextfield(
          preficon: desico,
          controller: des,
          hinttext: "Enter Item Description",
        ),
        const SizedBox(
          height: 10,
        ),
        Mytextfield(
          preficon: priceico,
          controller: price,
          hinttext: "Enter Item Price",
        ),
      ],
    );
  }
}
