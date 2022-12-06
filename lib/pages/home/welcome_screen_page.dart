import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';
import 'bottom_navigation_bar.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    _navigateToHomePage();
  }

  _navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomBar()),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffE38B29),
        body: Container(
          padding: EdgeInsets.only(
            left: Dimensions.width15,
            right: Dimensions.width15,
            top: Dimensions.height15,
            bottom: Dimensions.height15,
          ), //EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Image of bottle
                Image.asset(
                  './wines/wine_2.png',
                  scale: 1.5,
                ),

                Center(
                  child: Text(
                    "The taste of wine is very simple",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.font16,
                      letterSpacing: 5,
                      wordSpacing: 5,
                    ),
                  ),
                ),

                // Button with text and and arrow button inside
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xffE9C9A2)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed("/bottom-bar");
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Explorer le meilleur gout',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
