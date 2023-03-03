import 'package:ecommerce/data/repository/poular_product_repo.dart';
import 'package:ecommerce/models/products_model.dart';
import 'package:get/get.dart';

class  PopularProductController extends GetxController{
 final PoularProductRepo popularProductRepo;
PopularProductController({required this.popularProductRepo});
List<ProductModel> _popularProductList = [];
List<ProductModel> get popularProductList => _popularProductList;

bool _isLoaded =false;
bool get isLoaded=> _isLoaded;
Future<void> getPopularProductList()async{
Response response = await popularProductRepo.getPopularProductList();
print(popularProductRepo.getPopularProductList());
if(response.statusCode ==200){

  print("got prodcuts");
_popularProductList = [];
_popularProductList.addAll(Product.fromJson(response.body).products);
//print (_popularProductList);
_isLoaded = true;
update(); 
}else{
print('response not 200');

}
}

}