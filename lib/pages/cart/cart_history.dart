import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int>cartItemsPerOrder = Map();
    //for

    for(int i= 0; i < getCartHistoryList.length; i++){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value)=>++value);


      }else{
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e) => e.value,).toList();
    }
    List<int> orderTimes = cartOrderTimeToList();

    var saveCounter=0;
    return Scaffold(
     
      
      body: Column(

        children: [
          Container(

            height: 100,
            color:AppColors.mainColor,
            width:double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History",
                color: Colors.white,
                ),
                AppIcon(icon: Icons.shopping_cart_outlined,
                iconColor: AppColors.mainColor,
                backgroundColor: AppColors.yellowColor,
                )
              ],
            ),
          ),



          Expanded(
            child: Container(
            
              margin:EdgeInsets.only(
                top:Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
          
                child:ListView(
                  children: [
                    for(int i=0; i<cartItemsPerOrder.length;i++)
                        Container(
                          margin: EdgeInsets.only(
                            bottom: Dimensions.height20 
                          ),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                BigText(text: "05/02/2022 "+cartItemsPerOrder.length.toString()),
                                Row(
                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Text("hi there"),
                                        Text("hi there"),
                                      ],

                                    ),
                                  ],
                                ),
                              ],
                          ),
                        )

                    
                   
          
                  ],
          
                
              )
            ),
          ),
        ],
      ),
    ); 
    
  }
}