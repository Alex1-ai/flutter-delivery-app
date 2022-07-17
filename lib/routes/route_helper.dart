import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detial.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper{

  // home page
  static const String initial="/";
  static const String popularFood = "/popular-food";
   static const String recommendedFood = "/recommended-food";

  // this helps pass information as argument to the popularfooddetails
  static String getInitial()=>"$initial";
  static String getPopularFood(int pageId)=>"$popularFood?pageId=$pageId";
  static String getRecommendedFood(int pageId)=>"$recommendedFood?pageId=$pageId";
  


  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=>MainFoodPage()),
    GetPage(name: popularFood , page: (){
    
      var pageId=Get.parameters['pageId'];
    
      return PopularFoodDetail(pageId:int.parse(pageId!));
      },

      transition: Transition.fadeIn
      
      
      ), 
      GetPage(name: recommendedFood, 
      page: (){
        var pageId=Get.parameters['pageId'];
        return RecommendedFoodDetail(pageId:int.parse(pageId!));
      },
      transition: Transition.downToUp
      
      )





  ];
}