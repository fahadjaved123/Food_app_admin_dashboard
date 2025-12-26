import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/View/Main_page.dart';
import 'package:food_app_adminpanel/View_Model/Login_VM.dart';
import 'package:food_app_adminpanel/res/Components/My_button.dart';
import 'package:food_app_adminpanel/res/Components/My_textfield.dart';

class Login extends StatefulWidget {
  final double height;
  final double padding;
  final desktop;
  final mobile;
  Login(
      {super.key,
      required this.height,
      required this.padding,
      required this.desktop,
      required this.mobile});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isloading = false;
  final loginVM = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    // login method

    Dispose() {
      emailcontroller.dispose();
      passwordcontroller.dispose();
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.lock_open,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(
              height: widget.height * 0.03,
            ),
            // message ,salogon,
            Text('Food Delivery App'),
            SizedBox(
              height: widget.height * 0.03,
            ),
            // Email textfield
            Mytextfield(
              controller: emailcontroller,
              hinttext: 'Enter your Email',
            ),
            SizedBox(
              height: widget.height * 0.03,
            ),
            // password textfield
            Mytextfield(
              controller: passwordcontroller,
              hinttext: 'Password ',
              obsuretext: true,
            ),
            SizedBox(
              height: widget.height * 0.03,
            ),
            // sign button
            Mybutton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainPage(
                              
                            )),
                    (router) => false);
              },
              text: Text(
                "Sign",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: widget.height * 0.03,
            ),
            // not a member ? registor now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a Member ? ",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text("Register Now !",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 18)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
