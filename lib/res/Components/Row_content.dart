import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/res/Components/My_textfield.dart';
import 'package:iconsax/iconsax.dart';

class RowContent extends StatelessWidget {
  final TextEditingController searchcont;

  const RowContent({
    super.key,
    required this.searchcont,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // LEFT → Title
            const Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(width: 12),

            // SEARCH (hide on mobile)
            if (!isMobile)
              Expanded(
                child: Mytextfield(
                  
                  padding: 16, // FIXED
                  borderRadius: 30,
                  preficon: Iconsax.search_normal,
                  
                  controller: searchcont,
                  hinttext: "Search",
                ),
              ),

            const SizedBox(width: 16),

            // SEARCH ICON (mobile only)
            if (isMobile)
              IconButton(
                icon: const Icon(Iconsax.search_normal),
                onPressed: () {
                  // open search bottom sheet / dialog
                },
              ),

            IconButton(
              icon: const Icon(Iconsax.notification),
              onPressed: () {},
            ),

            const SizedBox(width: 8),

            // Profile Image
            CircleAvatar(
              radius: isMobile ? 18 : 22,
              backgroundImage: const AssetImage("assets/images/6596121.png"),
            ),

            const SizedBox(width: 8),

            // Name & Role (hide on mobile)
            if (!isMobile)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Ferra Alexandra",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Store Admin",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
