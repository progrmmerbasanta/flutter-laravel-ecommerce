import 'package:ecommerce/data/repository/poular_product_repo.dart';
import 'package:ecommerce/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors.dart';

class  PopularProductController extends GetxController{
 final PoularProductRepo popularProductRepo;
PopularProductController({required this.popularProductRepo});
List<ProductModel> _popularProductList = [];
List<ProductModel> get popularProductList => _popularProductList;

bool _isLoaded =false;
bool get isLoaded=> _isLoaded;

int _quantity=0;
int get quantity=>_quantity;
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
void setQuantity(bool isIncrement){
  if(isIncrement){
   // print("increment"+_quantity.toString());
_quantity =checkQuantity(_quantity+1);
  }else{
_quantity =checkQuantity(_quantity-1);
print("decrement"+_quantity.toString());
  }
  update();
}
int checkQuantity(int quantity){
  if(quantity<0){
    Get.snackbar("Item count", "You can't reduce more !",
    backgroundColor:AppColors.mainColor,
    colorText:Colors.white,
    );
    return 0;
  } else if(quantity >20){
    Get.snackbar("Item count", "You can't add more !",
    backgroundColor:AppColors.mainColor,
    colorText:Colors.white,
    );
    return 20;
  } else{
    return  quantity;
  }
}
void initProduct(){
  _quantity=0;
}

}