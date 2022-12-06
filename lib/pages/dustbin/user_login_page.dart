import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wine_recognizer/pages/dustbin/user_signup_page.dart';
import 'package:wine_recognizer/utils/app_styles.dart';
import 'package:wine_recognizer/widgets/bigText.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.screenWidth,
      height: Dimensions.screenHeight,
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
                width: Dimensions.screenWidth,
                height: Dimensions.screenHeight * 0.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("./wines/background.jpg"),
                        fit: BoxFit.cover))),
            Container(
              width: Dimensions.screenWidth,
              margin: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Hello",
                    size: Dimensions.iconSize28,
                    color: StylesApp.primaryColor,
                  ),
                  BigText(
                    text: "Sign into your account",
                    size: Dimensions.iconSize16,
                    color: StylesApp.container2Color,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle:
                              TextStyle(color: StylesApp.container2Color),
                          prefixIcon: Icon(
                            Icons.email,
                            color: StylesApp.primaryColor,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30))),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle:
                              TextStyle(color: StylesApp.container2Color),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: StylesApp.primaryColor,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30))),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      BigText(
                        text: "Sign into your account",
                        size: 20,
                        color: StylesApp.container2Color,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height50,
            ),
            Container(
                width: Dimensions.screenWidth * 0.5,
                height: Dimensions.screenHeight * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    image: const DecorationImage(
                        image: AssetImage("./wines/bckgr_white.jpg"),
                        fit: BoxFit.cover)),
                child: Center(
                  child: BigText(
                    text: "Sign in",
                    color: StylesApp.primaryColor,
                    size: Dimensions.font26,
                  ),
                )),
            SizedBox(
              height: Dimensions.height50,
            ),
            RichText(
              text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                      color: StylesApp.container2Color,
                      fontSize: Dimensions.font12),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignUpPage()),
                        text: "  Create",
                        style: TextStyle(
                            color: StylesApp.primaryColor,
                            fontSize: Dimensions.font12,
                            fontWeight: FontWeight.bold))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
