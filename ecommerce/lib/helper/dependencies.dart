import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/data/repository/poular_product_repo.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';
Future<void>init()async{
  //api client
Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstants.BASE_URL));
//repository
Get.lazyPut(() => PoularProductRepo(apiClient:Get.find()));
//controller
Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
}


