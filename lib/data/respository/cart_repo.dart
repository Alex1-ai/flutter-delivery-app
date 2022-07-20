import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{
    final SharedPreferences sharedPreferences;

    CartRepo({ required this.sharedPreferences});

    List<String> cart=[];


    void addToCartList(List<CartModel> cartList){
       cart = [];

       // CONVERT OBJECTS TO STRING BECAUSE SHAREDREFERENCE ONLY
       // ACCEPTS STRING

       cartList.forEach((element) {
        return cart.add(jsonEncode(element));
       });

       sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
       print(sharedPreferences.getStringList(AppConstants.CART_LIST));  

    }
  
}