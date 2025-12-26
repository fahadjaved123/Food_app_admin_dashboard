// import 'package:flutter/material.dart';
// import 'package:food_app_adminpanel/res/Components/ListTile.dart';
// import 'package:iconsax/iconsax.dart';

// class Mydrawer extends StatelessWidget {
//   const Mydrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 80),
//         child: Column(
//           children: [
//             Icon(
//               Icons.lock_open,
//               color: Theme.of(context).colorScheme.inversePrimary,
//               size: 70,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Divider(
//                 color: Theme.of(context).colorScheme.secondary,
//                 thickness: 2,
//               ),
//             ),
//             // home list tile
//             Mylisttile(
//               icon: Iconsax.home,
//               text: 'H O M E ',
//               ontap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             // setting list tile
//             Mylisttile(
//               icon: Iconsax.setting,
//               text: 'S E T T I N G S',
//               ontap: () {
//                 //Navigator.pushNamed(context, RoutesName.setting);
//               },
//             ),
//             const Spacer(),
//             // logout list tile
//             Mylisttile(
//               icon: Iconsax.logout_14,
//               text: 'L O G O U T',
//               ontap: () {},
//             ),
//             SizedBox(height: 25),
//           ],
//         ),
//       ),
//     );
//   }
// }
