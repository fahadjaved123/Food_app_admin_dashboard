import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final controller;
  final bool obsuretext;
  final hinttext;
  final double? borderRadius;
  final double? padding;
  final IconData? preficon;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  Mytextfield(
      {super.key,
      this.focusNode,
      this.onFieldSubmitted,
      this.borderRadius,
      this.preficon,
      this.padding,
      required this.controller,
      this.hinttext,
      this.obsuretext = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 20),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        controller: controller,
        obscureText: obsuretext,
        decoration: InputDecoration(
            prefixIcon: Icon(preficon),
            hintText: hinttext,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
            )),
      ),
    );
  }
}
