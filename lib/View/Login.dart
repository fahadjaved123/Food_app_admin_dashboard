import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View_Model/Login_VM.dart';
import 'package:food_app_adminpanel/res/Components/My_button.dart';
import 'package:food_app_adminpanel/res/Components/My_textfield.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isloading = false;
  final loginVM = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final isDesktop = size.width > 800;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
              Theme.of(context).colorScheme.secondary.withOpacity(0.8),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 450),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo or Icon
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.restaurant_menu,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Welcome Back',
                    style: GoogleFonts.outfit(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to manage your kitchen',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 40),
              
                   // Email textfield
              Mytextfield(
                focusNode: loginVM.emailfocus,
                controller: loginVM.usernamecontroller,
                hinttext: 'Enter your Email',
                onFieldSubmitted: (p0) {
                  loginVM.emailfocus.unfocus();
                  FocusScope.of(context).requestFocus(loginVM.passwordfocus);
                },
              ),
                  const SizedBox(height: 20),
              
                  // Password Field
                  Mytextfield(
                focusNode: loginVM.passwordfocus,
                controller: loginVM.passwordcontroller,
                hinttext: 'Password ',
                obsuretext: true,
                onFieldSubmitted: (p0) {
                  loginVM.loginApi(context);
                },
              ),
                  const SizedBox(height: 12),
              
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const SizedBox(height: 32),
              
                  // Login Button
                 Obx(() {
                return Mybutton(
                  isloading: loginVM.loading.value,
                  onPressed: () {
                    loginVM.loginApi(context);
                  },
                  text: Text(
                    "Sign",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  

 
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // logo
//               Icon(
//                 Icons.lock_open,
//                 size: 100,
//                 color: Theme.of(context).colorScheme.inversePrimary,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               // message ,salogon,
//               Text('Food Delivery App'),
//               SizedBox(
//                 height: 10,
//               ),
//               // Email textfield
//               Mytextfield(
//                 focusNode: loginVM.emailfocus,
//                 controller: loginVM.usernamecontroller,
//                 hinttext: 'Enter your Email',
//                 onFieldSubmitted: (p0) {
//                   loginVM.emailfocus.unfocus();
//                   FocusScope.of(context).requestFocus(loginVM.passwordfocus);
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               // password textfield
//               Mytextfield(
//                 focusNode: loginVM.passwordfocus,
//                 controller: loginVM.passwordcontroller,
//                 hinttext: 'Password ',
//                 obsuretext: true,
//                 onFieldSubmitted: (p0) {
//                   loginVM.loginApi(context);
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               // sign button
//               Obx(() {
//                 return Mybutton(
//                   isloading: loginVM.loading.value,
//                   onPressed: () {
//                     loginVM.loginApi(context);
//                   },
//                   text: Text(
//                     "Sign",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 );
//               }),

//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
