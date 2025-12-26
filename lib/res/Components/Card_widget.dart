import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/res/Components/enum.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final Widget child;
  final bool dropdown;
  const CardWidget({
    super.key,
    this.dropdown = false,
    required this.title,
    required this.child,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  ChartFilter selectedFilter = ChartFilter.month;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (widget.dropdown)
                SizedBox(
                  width: 70,
                  child: DropdownButton<ChartFilter>(
                    isExpanded: true,
                    value: selectedFilter,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: ChartFilter.month,
                        child: Text("Monthly", style: TextStyle(fontSize: 9)),
                      ),
                      DropdownMenuItem(
                        value: ChartFilter.year,
                        child: Text("Yearly", style: TextStyle(fontSize: 9)),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => selectedFilter = value);
                      }
                    },
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(child: widget.child),
        ],
      ),
    );
    ;
  }
}
