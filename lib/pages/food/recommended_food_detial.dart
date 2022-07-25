import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';


class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];

     Get.find<PopularProductController>().initProduct(product,  Get.find<CartController>());


    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    if(page=="cartpage"){
                    Get.toNamed( RouteHelper.getCartPage ());
                    }else{
                      Get.toNamed( RouteHelper.getInitial ());
                    }
                  
                  },
                  
                  child: AppIcon(icon: Icons.clear)
                  
                  ),

             
                //AppIcon(icon: Icons.shopping_cart_outlined)
                
                GetBuilder<PopularProductController>(
                  builder: (controller){
                    return Stack(
                      children: [
                         GestureDetector(
                            onTap: (){
                              // if(controller.totalItem>=1)Get.toNamed(RouteHelper.getCartPage());
                              Get.toNamed(RouteHelper.getCartPage());
                            },
                        child: AppIcon(icon: Icons.shopping_cart_outlined),
                         ),
                        Get.find<PopularProductController>().totalItem>=1?
                        Positioned(
                          right: 0,top:0,
                          
                            child: AppIcon(icon: Icons.circle,size:20, 
                            iconColor: Colors.transparent,
                            backgroundColor: AppColors.mainColor,
                            ),
                          
                        ):
                        Container(),

                        Get.find<PopularProductController>().totalItem>=1?
                        Positioned(
                          right: 3,top:3,
                          child: BigText(text:Get.find<PopularProductController>().totalItem.toString(),
                            size: 12.02,
                            color: Colors.white,
                          
                           )
                          
                          
                        ):
                        Container()
                      
                      ],
                    );
                  })



              ],
             ),
            bottom: PreferredSize(
             
              preferredSize: Size.fromHeight(20),
               child: Container(
                
                child: Center(
                  child: BigText( size:Dimensions.font26, text: product.name!),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top:5, bottom:10),

               decoration: BoxDecoration(
                color:Colors.white,
                borderRadius:BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20)
                ) 
               ), 
               ), 
              ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
              // complete width  to cover the screen
              width:double.maxFinite,
              fit:BoxFit.cover,

              ),
            ),
          )
          ,
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  
                  child:ExpandableTextWidget(text: product.description!
                ),
                ),
              ],
            ),

          )
        
        ],
      )
    ,
      bottomNavigationBar:
       GetBuilder<PopularProductController>(
        builder: (controller){
          return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom:Dimensions.height10
            ),

            child:    Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              GestureDetector(
                onTap: (){
                  controller.setQuantity(false);

                },
                child: AppIcon(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  
                  ),
              ),



              BigText(text: "\$${product.price} X  ${controller.inCartItems} ", color: AppColors.mainBlackColor, size: Dimensions.font26,),
              GestureDetector(
                onTap: (){
                  controller.setQuantity(true);

                },
                child: AppIcon(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  
                  ),
              ),


            ],
          ),
          

           ),
       
           

            Container(
        height: Dimensions.bottomHeightBar120,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30,
        left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          ),
        ),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top:Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),

              child:Icon(
                Icons.favorite,
                color:AppColors.mainColor,
              ),
            )
          ,
            GestureDetector(
              onTap: (){
                controller.addItem(product);

              },
              child: Container(
              padding: EdgeInsets.only(
                top:Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20
              ),
              child: BigText(text: "\$ ${product.price} | Add to cart",
               color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                Dimensions.radius20
                ),
                color: AppColors.mainColor,
              ),
            ),
            )
          
          ],

        ),
      ),
    
    
       
        ],


      );
        }
        
        
        )
    );
    
  }
}