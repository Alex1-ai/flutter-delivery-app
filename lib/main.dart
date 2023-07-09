

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/Auth/sign_in_page.dart';
import 'package:food_delivery/pages/Auth/sign_up_page.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detial.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;


// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = new MyHttpOverrides();
  // ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  // SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
  await dep.init();
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder:(_){
          return GetBuilder<RecommendedProductController>(builder: (_){
              

            return  GetMaterialApp(
               debugShowCheckedModeBanner: false,
               title: 'Flutter Demo',

      // home:HomePage(),
     //home:SplashScreen(),
     //home: SignInPage()


      //home: MainFoodPage(),
               initialRoute: RouteHelper.getSplashPage(),
               getPages: RouteHelper.routes,



      // routes: {
      //   HomePage.routeName: (ctx)=>HomePage(),
      // },
    );
          });
    });
  }
}

