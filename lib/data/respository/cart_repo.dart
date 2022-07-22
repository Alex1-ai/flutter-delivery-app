import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{
    final SharedPreferences sharedPreferences;

    CartRepo({ required this.sharedPreferences});

    List<String> cart=[];

    List<String> cartHistory=[];


    void addToCartList(List<CartModel> cartList){
       //sharedPreferences.remove(AppConstants.CART_LIST);
       //sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
       var time = DateTime.now().toString();
       cart = [];

       // CONVERT OBJECTS TO STRING BECAUSE SHAREDREFERENCE ONLY
       // ACCEPTS STRING

      //  cartList.forEach((element) {
      //   return cart.add(jsonEncode(element));
      //  });

      //OR
      cartList.forEach((element){
       element.time = time;

        return cart.add(jsonEncode(element));
    });

    

       sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
       //print(sharedPreferences.getStringList(AppConstants.CART_LIST));  
       //getCartList();
    }



  List<CartModel> getCartList(){
    List<String> carts = [];

    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("inside getCartList "+carts.toString());
    
    
    }
    List<CartModel> cartList=[];

    // carts.forEach((element) {
    //   cartList.add(CartModel.fromJson(jsonDecode(element)));
      
    // });
    //or 
    carts.forEach((element)=>cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  List<CartModel> getCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
        cartHistory=[];
        cartHistory = sharedPreferences.getStringList(
          AppConstants.CART_HISTORY_LIST
        )!;
    }
    List<CartModel> cartListHistory=[];
    cartHistory.forEach((element) =>cartListHistory
    .add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }
  
  void addToCartHistoryList(){

    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory= sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for(int i = 0; i< cart.length; i++){ 
      print("History list" + cart[i]);
      cartHistory.add(cart[i]);

    }

    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
  }
  void removeCart(){
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
    print("The length of history of cart is "+getCartHistoryList().length.toString() );
    for(int j = 0; j<getCartHistoryList().length; j++){
           print("The time for the order is "+getCartHistoryList()[j].time.toString());
    }
 
  }
    
}