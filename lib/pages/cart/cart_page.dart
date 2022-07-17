import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Positioned(
            top:Dimensions.height20*2,

            left: Dimensions.width20,
            right: Dimensions.width20,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios,
                iconColor: Colors.white,
                backgroundColor:AppColors.mainColor,
                iconSize:Dimensions.iconSize24 ,
                
                ),
                SizedBox(width: Dimensions.width20*5,),
                AppIcon(icon: Icons.home_outlined,
                iconColor: Colors.white,
                backgroundColor:AppColors.mainColor,
                iconSize:Dimensions.iconSize24 ,
                
                ),


                AppIcon(icon: Icons.shopping_cart,
                iconColor: Colors.white,
                backgroundColor:AppColors.mainColor,
                iconSize:Dimensions.iconSize24 ,
                
                ),



              ],
            ),
            ),

        ],
      )
    );
    
  }
}