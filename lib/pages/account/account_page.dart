import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "Profile", size:24,
        color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),

      body: Container(

        width: double.maxFinite,
        margin: EdgeInsets.only(top:Dimensions.height20),
        child: Column(
          
          children: [
            //PROFILE ICON
            AppIcon(icon: Icons.person,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: Dimensions.height45+Dimensions.height30,
            size: Dimensions.height15*10,
            
            ),
            SizedBox(height:Dimensions.height30),


            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                            // NAME
            AccountWidget(
              appIcon: AppIcon(icon: Icons.person,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize:Dimensions.height10*5/2 ,
            size: Dimensions.height10*5,
            
            ),
               bigText: BigText(text: "Emmanuel"),
               
               ),
               SizedBox(height: Dimensions.height20,),

           // PHONE

          AccountWidget(
              appIcon: AppIcon(icon: Icons.phone,
            backgroundColor: AppColors.yellowColor,
            iconColor: Colors.white,
            iconSize:Dimensions.height10*5/2 ,
            size: Dimensions.height10*5,
            
            ),
               bigText: BigText(text: "+233-50-316-8382"),
               
               ),
               SizedBox(height: Dimensions.height20,),


           //EMAIL
          AccountWidget(
              appIcon: AppIcon(icon: Icons.email,
            backgroundColor: AppColors.yellowColor,
            iconColor: Colors.white,
            iconSize:Dimensions.height10*5/2 ,
            size: Dimensions.height10*5,
            
            ),
               bigText: BigText(text: "alex@gmail.com"),
               
               ),
               SizedBox(height: Dimensions.height20,),

           // ADDRESS

           AccountWidget(
              appIcon: AppIcon(icon: Icons.location_on,
            backgroundColor: AppColors.yellowColor,
            iconColor: Colors.white,
            iconSize:Dimensions.height10*5/2 ,
            size: Dimensions.height10*5,
            
            ),
               bigText: BigText(text: "Ghana Accra Dansoman"),
               
               ),
               SizedBox(height: Dimensions.height20,),


          //MESSAGES
          AccountWidget(
              appIcon: AppIcon(icon: Icons.message_outlined,
            backgroundColor:Colors.redAccent,
            iconColor: Colors.white,
            iconSize:Dimensions.height10*5/2 ,
            size: Dimensions.height10*5,
            
            ),
               bigText: BigText(text: "Emmanuel"),
               
               ),
               SizedBox(height: Dimensions.height20,),

                    
            //MESSAGES
          AccountWidget(
              appIcon: AppIcon(icon: Icons.message_outlined,
            backgroundColor:Colors.redAccent,
            iconColor: Colors.white,
            iconSize:Dimensions.height10*5/2 ,
            size: Dimensions.height10*5,
            
            ),
               bigText: BigText(text: "Emmanuel"),
               
               ),
               SizedBox(height: Dimensions.height20,),


                  ],
                ),
              ),
            )
                         
    
      
          ],
        ),
      ),

    );
    
  }
}