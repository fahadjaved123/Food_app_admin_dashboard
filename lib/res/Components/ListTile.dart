import 'package:flutter/material.dart';

class Mylisttile extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isExpanded;

  const Mylisttile({
    super.key,
    required this.icon,
    required this.isExpanded,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          height:56 ,
         width: isExpanded ? 250 : 60,
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),

              Icon(
                icon,
                size: 26,
                color: isSelected ? Colors.white : Colors.grey.shade700,
              ),

              // Vertical Divider
              isExpanded
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      width: 1.5,
                      height: 28,
                      color: isSelected ? Colors.white : Colors.grey.shade400,
                    )
                  : SizedBox(),

              // Text
              isExpanded
                  ? Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color:
                              isSelected ? Colors.white : Colors.grey.shade800,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
