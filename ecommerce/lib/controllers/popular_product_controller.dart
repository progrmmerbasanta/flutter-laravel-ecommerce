import 'package:ecommerce/data/repository/poular_product_repo.dart';
import 'package:ecommerce/models/products_model.dart';
import 'package:get/get.dart';

class  PopularProductController extends GetxController{
 final PoularProductRepo popularProductRepo;
PopularProductController({required this.popularProductRepo});
List<dynamic> _popularProductList = [];
List<dynamic> get popularProductList => _popularProductList;
Future<void> getPopularProductList()async{
Response response = await popularProductRepo.getPopularProductList();
if(response.statusCode ==200){
  print("got prodcuts");
_popularProductList = [];
_popularProductList.addAll(Product.fromJson(response.body).products);
//print (_popularProductList);
update(); 
}else{


}
}

}