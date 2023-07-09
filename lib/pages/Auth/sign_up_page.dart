import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/Base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../Base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key}) : super(key: key);

  @override
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var signUpImages = [
    "t.png",
    "f.png",
    "g.png"

  ];
  Widget build(BuildContext context) {
      void _registration(AuthController authController){
      // var authController = Get.find<AuthController>();
      String name= nameController.text.trim();
      String phone= phoneController.text.trim();
      String email= emailController.text.trim();
      String password= passwordController.text.trim();
      
      if(name.isEmpty){
        showCustomSnackBar("Type in your name", title:"Name");

      }else if(phone.isEmpty){
         showCustomSnackBar("Type in your phone number", title:"Phone number");

      }else if(email.isEmpty){
         showCustomSnackBar("Type in your email address", title:"Email address");

      }else if(!GetUtils.isEmail(email)){
         showCustomSnackBar("Type in a valid email address", title:"Valid email address ");

      }else if(password.isEmpty){
         showCustomSnackBar("Type in your password", title:"password");

      }else if(password.length < 6){
         showCustomSnackBar("Password can not be less thabn six characters", title:"Password");

      }else{
         //showCustomSnackBar("All went well", title:"Perfect");
         SignupBody signUpBody =SignupBody(
          name: name,
           phone: phone, 
           email: email, 
           password: password,


           );
           authController.registration(signUpBody).then((status){
            if(status.isSuccess){
              print("Success registration");
              Get.offNamed(RouteHelper.getInitial());
            }else{
              showCustomSnackBar(status.message);
            }
           });
          // print(signUpBody.toString());
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (_authController){
          return !_authController.isLoading? SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight*0.05,),
            // APP LOGO
            Container(
              height: Dimensions.screenHeight*0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage(
                    "assets/image/logo part 1.png"
                  ),
                ),
              ),
            )
      ,
           // EMAIL
            AppTextField(
              textController: emailController,
               hintText: "Email",
                icon: Icons.email
                ),
      
            SizedBox(height: Dimensions.height20,),
      
           // PASSWORD
            AppTextField(
              textController: passwordController,
               hintText: "Password",
                icon: Icons.password_sharp,
                isObscure: true,
                ),
      
            SizedBox(height: Dimensions.height20,),
            
            // NAME
            AppTextField(
              textController: nameController,
               hintText: "Name",
                icon: Icons.person
                ),
      
            SizedBox(height: Dimensions.height20,),
            
            AppTextField(
              textController: phoneController,
               hintText: "Phone",
                icon: Icons.phone
                ),
      
            SizedBox(height: Dimensions.height20,),
            
          
          // SIGN UP Button
          GestureDetector(
            onTap: (){
              _registration(_authController);

            },
            child: Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.radius30
                ),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: "Sign Up",
                  size: Dimensions.font20+Dimensions.font20/2,
                  color: Colors.white,
                  ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
           
          // HAVE AN ACCOUNT QUESTIONS
          RichText(
            text: TextSpan(
              recognizer:
               TapGestureRecognizer()..onTap=()=>Get.back(),
            
            text: "Have an account already ?",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: Dimensions.font20
            )
            
          )),
      
        SizedBox(height: Dimensions.screenHeight*0.05,),
          
          //  SIGN UP OPTIONS
          RichText(
            text: TextSpan(
            text: "Sign up using one of the following methods",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: Dimensions.font16
            )
            
          )),
          Wrap(
            children: List.generate(3, (index) => 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: Dimensions.radius30,
                backgroundImage: AssetImage(
                  "assets/image/"+signUpImages[index]
                ),
      
              ),
            )),
      
          ),
      
      
        ]),
      )
      :
      CustomLoader();


        },)

    );
    
  }
}