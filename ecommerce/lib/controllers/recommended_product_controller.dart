import 'package:ecommerce/data/repository/poular_product_repo.dart';
import 'package:ecommerce/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';

class  RecommendedProductController extends GetxController{
 final  RecommendedProductRepo recommendedProductRepo;
RecommendedProductController({required this.recommendedProductRepo});
List<ProductModel> _recommendedProductList = [];
List<ProductModel> get recommendedProductList => _recommendedProductList;

bool _isLoaded =false;
bool get isLoaded=> _isLoaded;
Future<void> getRecommendedProductList()async{
Response response = await recommendedProductRepo.getRecommendedProductList();
print(recommendedProductRepo.getRecommendedProductList());
if(response.statusCode ==200){

_recommendedProductList = [];
_recommendedProductList.addAll(Product.fromJson(response.body).products);
//print (_popularProductList);
_isLoaded = true;
update(); 
}else{
 print(" could not get prodcuts recommended");
}
}

}