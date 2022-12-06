import 'package:flutter/material.dart';
import 'package:wine_recognizer/widgets/smallText.dart';

import '../utils/app_styles.dart';
import '../utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstText;
  late String secondText;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstText = widget.text.substring(0, textHeight.toInt());
      secondText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstText = widget.text;
      secondText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondText.isEmpty
          ? SmallText(
              height: 1.8,
              text: firstText,
              color: StylesApp.textColor3,
            )
          : Column(
              children: [
                SmallText(
                  height: 1.8,
                  color: StylesApp.textColor3,
                  text:
                      hiddenText ? ("$firstText...") : (firstText + secondText),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddenText ? "Show more" : "Show less",
                        color: StylesApp.primaryColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: StylesApp.primaryColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
