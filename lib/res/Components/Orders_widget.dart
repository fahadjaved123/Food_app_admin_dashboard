import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrdersWidget extends StatelessWidget {
  final IconData iconData;
  final String maintext;
  final String text;

  const OrdersWidget({
    super.key,
    required this.iconData,
    required this.maintext,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 2),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(iconData, size: 28, color: Colors.blue),
            const SizedBox(width: 10),
            Expanded(
              // ✅ CRITICAL
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    maintext,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
