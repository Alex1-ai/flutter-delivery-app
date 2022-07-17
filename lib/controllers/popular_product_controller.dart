import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/respository/popular_product_repo.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
import 'package:food_delivery/models/products_model.dart';

class PopularProductController extends GetxController{
   final PopularProductRepo popularProductRepo;
   PopularProductController({required this.popularProductRepo});
   List<ProductModel> _popularProductList=[];
   List<ProductModel> get popularProductList => _popularProductList;
   late CartController _cart;
   
   bool _isLoaded = false;
   bool get isLoaded=>_isLoaded;
    
   int _quantity=0;
   

   int get quantity=>_quantity;

   int _inCartItems=0;
   int get inCartItems=>_inCartItems+_quantity;

   Future<void> getPopularProductList()async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      print("Got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
    //  print(_popularProductList);
      _isLoaded=true;
      update();
    }else{
      print(response.statusText);
      print(response.bodyString);

      // print("nothing came");

    }

   }

  
  void setQuantity(bool isIncrement){
    if(isIncrement){
      print("increment" + _quantity.toString());
      _quantity = checkQuantity(_quantity+1);
    }else{
      print("decrement");
      _quantity=  checkQuantity(_quantity-1);

    }
    update();
  }
  int checkQuantity(int quantity){
    if((_inCartItems + quantity)<0){
      Get.snackbar("Item count","You can't reduce more !",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white
      );
      return 0;
    }else if((_inCartItems + quantity)>20){
      Get.snackbar("Item Count", "You can't add more !",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white
      );
      return 20;
    }else{
      return quantity;
    }


  }
  

  void initProduct(ProductModel product, CartController cart){
    _quantity = 0; 
    _inCartItems=0;
    // if exists
    // get from storage _inCartItems
    _cart=cart;
    var exist=false;
    exist = _cart.existInCart(product);
    print("exist or not "+exist.toString());
    if(exist){
      _inCartItems=_cart.getQuantity(product);
      
    }
    print("The quantity in the cart is "+inCartItems.toString());
     
  }
  


  void addItem(ProductModel product){
    // if(_quantity>0){
        _cart.addItem(product, _quantity);
        _quantity=0;
        _inCartItems = _cart.getQuantity(product);
        _cart.items.forEach((key, value) { 
          print("This id is "+value.id.toString()+" The quantity is "+value.quantity.toString());
        });

    // }else{
    //   Get.snackbar("Item count", "You can't add an empty product",
    //   backgroundColor: AppColors.mainColor,
    //   colorText: Colors.white
      
    //  );
   // }

  }

   
}