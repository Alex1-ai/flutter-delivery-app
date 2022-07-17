import 'package:food_delivery/data/respository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:food_delivery/models/products_model.dart';

import '../data/respository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
   final RecommendedProductRepo recommendedProductRepo;
   RecommendedProductController({required this.recommendedProductRepo});
   List<ProductModel> _recommendedProductList=[];
   List<ProductModel> get recommendedProductList => _recommendedProductList;

   
   bool _isLoaded = false;
   bool get isLoaded=>_isLoaded;

   Future<void> getRecommendedProductList()async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200){
      // print("Got products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      // print(_recommendedProductList);
      _isLoaded=true;
      update();
    }else{
      print(response.statusText);
      print(response.bodyString);

      print("nothing came");

    }

   }

}