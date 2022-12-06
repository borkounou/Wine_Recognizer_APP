import 'package:get/get.dart';

class Dimensions {
  // static double screenHeight = 683.11;
  // static double screenWidth = 411.1;
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double firstMainContainer = screenHeight / 1.7075;
  static double secondMainContainer = screenHeight / 2.276;
  static double imageContainerWidth = screenWidth / 2.74;

  static double pageViewContainer = screenHeight / 3.104;
  static double pageTextContainer = screenHeight / 5.7;
  static double pageView = screenHeight / 2.134375;

  //Height
  static double height10 = screenHeight / 68.3;
  static double height20 = screenHeight / 34.15;
  static double height15 = screenHeight / 45.5333;
  static double height30 = screenHeight / 22.76;
  static double height50 = screenHeight / 13.66;
  static double height5 = screenHeight / 136.6;

  // Width
  static double width10 = screenWidth / 41.10;
  static double width15 = screenWidth / 27.5;
  static double width20 = screenWidth / 20.55;
  static double width5 = screenWidth / 82.2;

  // margin
  static double imgConMarginTop200 = screenHeight / 4.01; //4.55; 3.415;
  static double imgConMarginBottom25 = screenHeight / 34.15; //27.32;
  static double popularImageContainer = screenHeight / 5.6916;
  static double detailContainer1 = screenHeight / 3.415;

  // Font size
  static double font20 = screenHeight / 34.15;
  static double font12 = screenHeight / 56.91666667;
  static double font26 = screenHeight / 26.26923077;
  static double font16 = screenHeight / 42.7;

  // Radius
  static double radius15 = screenHeight / 45.5333;
  static double radius20 = screenHeight / 34.15;
  static double radius30 = screenHeight / 22.766666;
  static double radius50 = screenHeight / 13.66;
  static double radius100 = screenHeight / 6.83;

  // icon size
  static double iconSize24 = screenHeight / 28.45833;
  static double iconSize16 = screenHeight / 42.6875;
  static double iconSize28 = screenHeight / 24.39;
  static double iconSize70 = screenHeight / 9.757;

  // Popular image container
  static double popularImgHeight = screenHeight / 6.83;
  static double popularImgWidth = screenWidth / 4.11;

  // Wine description detail
  static double bottomNavBarContainerHeight = screenHeight / 13.66; //50;
  static double containerLongText = screenHeight / 4.55;
  static double wineDetailContainer = screenWidth / 2.055;

  // Image search
  static double positionTopHeight230 = screenHeight / 2.969;
  static double positionWidth80 = screenWidth / 5.1375;
  static double positionHeightContainer370 = screenHeight / 1.845;
  static double positionWidthContainer400 = screenWidth / 1.0275;
  static double positionWidth100 = screenWidth / 4.11;

  static double searcherContainer270 = screenHeight / 2.5296;
  static double searcherContainerHeight300 = screenHeight / 2.276666;
  static double searcherContainerWidth200 = screenWidth / 2.055;

  // Bottom height
  static double bottomHeightBar = screenHeight / 6.30;
  static double containerWidth150 = screenWidth / 2.74;
}
