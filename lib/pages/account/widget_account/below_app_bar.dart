import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_recognizer/utils/app_styles.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/dimensions.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: StylesApp.appBarGradient,
      ),
      padding: EdgeInsets.only(
          left: Dimensions.width10,
          right: Dimensions.width10,
          bottom: Dimensions.height10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: 'Hello, ',
                style: TextStyle(
                  fontSize: Dimensions.font20 + 2,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: user.name,
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
