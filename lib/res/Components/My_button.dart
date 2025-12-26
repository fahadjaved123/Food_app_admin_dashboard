import 'package:flutter/material.dart';

class Mybutton extends StatefulWidget {
  void Function()? onPressed;
  final text;
  bool isloading;
  Mybutton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isloading = false});

  @override
  State<Mybutton> createState() => _ButtonState();
}

class _ButtonState extends State<Mybutton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              )),
          child: widget.isloading
              ? Container(
                  margin: EdgeInsets.only(
                      left: 100, right: 100, top: 10, bottom: 10),
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                    strokeWidth: 2,
                  ),
                )
              : TextButton(onPressed: widget.onPressed, child: widget.text)),
    );
  }
}
