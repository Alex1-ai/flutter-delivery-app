import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/utils/dimension.dart';


class SplashScreen extends StatefulWidget {
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late Animation<double> animation;

  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
       ()=>Navigator.pushReplacementNamed(context, HomePage.routeName)
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