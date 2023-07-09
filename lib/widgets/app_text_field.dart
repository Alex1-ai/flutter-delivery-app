import "package:flutter/material.dart";
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';


class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon; 
  bool isObscure;
  AppTextField({Key? key,
  required this.textController,
  required this.hintText,
  required this.icon,
  this.isObscure = false,
  
  
  }) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return           Container(
            margin: EdgeInsets.only(left:Dimensions.height20,
            right: Dimensions.height20,),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:BorderRadius.circular(
                Dimensions.radius30
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 7,
                  offset: Offset(1,10),
                  color:Colors.grey.withOpacity(0.2)
                )
              ]
            ),
            child: TextField(
              obscureText: isObscure ? true:false,
              controller:  textController,
              decoration: InputDecoration(
                //hint Text,
                hintText: hintText,
                 // prefixIcon
                 prefixIcon: Icon(icon, 
                 color:AppColors.yellowColor,
                 ),
                  //focused Border 
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius30,
                    ),
                    borderSide: BorderSide(
                      width:1.0,
                      color:Colors.white
                    )

                    
                    ),

                   // ENABLED
            
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius30,
                    ),
                    borderSide: BorderSide(
                      width:1.0,
                      color:Colors.white
                    )
                    
                    
                     ),
                  
                  
                  //enableBorder 
                  //
                  //border
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius30
                    ),
                  ),



              ),


            ),
          );
     
    
  }
}