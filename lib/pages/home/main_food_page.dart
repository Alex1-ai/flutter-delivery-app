import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';





class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

Future<void>_loadResource()async{
  await Get.find<PopularProductController>().getPopularProductList();
  await Get.find<RecommendedProductController>().getRecommendedProductList();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print('current heigt is '+MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(
      onRefresh: _loadResource,
      child: Column(
        children: [
           Container(
        child: Container(
          margin: EdgeInsets.only(top:Dimensions.height45, bottom:Dimensions.height15),
          padding: EdgeInsets.only(left:Dimensions.width20, right:Dimensions.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BigText(text: "Nigeria",color: AppColors.mainColor),
                  Row(
                    children: [
                      SmallText(text: "Lagos", color: Colors.black54,),
                      Icon(Icons.arrow_drop_down_rounded)
    

                    ],
                  ),
                  
                ],
                ),
                Center( 
                  child: Container(
                  width: Dimensions.height45,
                  height:Dimensions.height45,
                  child: Icon(Icons.search, color: Colors.white, size:Dimensions.iconSize24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.mainColor,
                  ),
    
                ),
                )
            ],
    
          ),
        ),
      ),
        
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody() ,
            )
          ) 
        ],
      )
    
    );
  }
}