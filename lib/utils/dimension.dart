import 'package:get/get.dart';


class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  
  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  //dynamic height padding and margin
  static  double height10 = screenHeight/84.4;
  static double height15 = screenHeight/56.27;
  static  double height20 = screenHeight/42.2;
  static  double height30 = screenHeight/28.13;
  static double height45 = screenHeight/18.76;

  // dynmaic width padding and margin
  static  double width10 = screenHeight/84.4;
  static double width15 = screenHeight/56.27;
  static  double width20 = screenHeight/42.2;
  static  double width30 = screenHeight/28.13;

// font size
  static double font20 = screenHeight/42.2;
  static double font26 = screenHeight/32.46;
  static double font16 = screenHeight/52.75;


  // raidius
  static double radius15 = screenHeight/56.27;
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;


  // icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;


  // list view size
  static double 
  listViewImgSize120 = screenWidth/3.25;
  static double listViewTextContSize100=screenWidth/3.9;


  //popular food
  static double popularFoodImgSize350 = screenHeight/2.41;


  static double bottomHeightBar120 = screenHeight/7.03;

  // splash screen dimensions
  static double splashImg250 = screenHeight/3.38;

}


