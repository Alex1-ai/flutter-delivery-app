import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';


class SplashScreen extends StatefulWidget {
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late Animation<double> animation;

  late AnimationController controller;

  Future<void> _loadResource()async{
       await Get.find<PopularProductController>().getPopularProductList();
    // ignore: avoid_single_cascade_in_expression_statements
       await Get.find<RecommendedProductController>().getRecommendedProductList();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResource();
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5))..forward();
    
     
      animation = CurvedAnimation(
        parent: controller,
         curve: Curves.linear
        
        
      
      );
      // how long yo should wait before it
      // moves to the next actions
      Timer(
      const Duration(seconds: 10),
       ()=>Get.offNamed(RouteHelper.getInitial())
       );
      
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: 
              Image.asset("assets/image/logo part 1.png", 
              width: Dimensions.splashImg250,),
              ),
          ),

            Center(
            child: 
            Image.asset("assets/image/logo part 2.png", 
            width:Dimensions.splashImg250,),
            )
        ],
      ),
    );
    
  }
}