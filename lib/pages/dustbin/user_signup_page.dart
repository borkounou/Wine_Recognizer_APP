import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';
import '../../utils/dimensions.dart';
import '../../widgets/bigText.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    List images = ["gmail_logo.png", "facebook_logo.png", "twitter_logo.png"];
    return Scaffold(
      body: SizedBox(
        width: Dimensions.screenWidth,
        height: Dimensions.screenHeight,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: Dimensions.screenWidth,
                height: Dimensions.screenHeight * 0.315,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("./wines/bckgr_white.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.screenHeight * 0.18,
                    ),
                    CircleAvatar(
                      radius: Dimensions.radius30 + Dimensions.radius15,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          const AssetImage("./wines/profile_image.png"),
                    ),
                  ],
                ),
              ),
              Container(
                width: Dimensions.screenWidth,
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle:
                                TextStyle(color: StylesApp.container2Color),
                            prefixIcon: Icon(
                              Icons.email,
                              color: StylesApp.container2Color,
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
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius30))),
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
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle:
                                TextStyle(color: StylesApp.container2Color),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: StylesApp.container2Color,
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
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius30))),
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
                height: Dimensions.height30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    width: Dimensions.screenWidth * 0.5,
                    height: Dimensions.screenHeight * 0.07,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                        image: const DecorationImage(
                            image: AssetImage("./wines/bckgr_white.jpg"),
                            fit: BoxFit.cover)),
                    child: Center(
                      child: BigText(
                        text: "Sign up",
                        color: StylesApp.primaryColor,
                        size: Dimensions.font26,
                      ),
                    )),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.back(),
                      text: "Have an account?",
                      style: TextStyle(
                        fontSize: Dimensions.font16,
                        color: StylesApp.primaryColor,
                      ))),
              SizedBox(
                height: Dimensions.height50,
              ),
              RichText(
                text: TextSpan(
                  text: "Sign up using on of the following methods",
                  style: TextStyle(
                      color: StylesApp.container2Color,
                      fontSize: Dimensions.font12),
                ),
              ),
              Wrap(
                  children: List<Widget>.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.all(Dimensions.height10),
                  child: CircleAvatar(
                    radius: Dimensions.radius30,
                    backgroundColor: Colors.grey[500],
                    child: CircleAvatar(
                      radius: Dimensions.radius30 - Dimensions.height5,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("./wines/${images[index]}"),
                    ),
                  ),
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
