import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';

class PoularProductRepo extends GetxService{
  final ApiClient apiClient;
  PoularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList()async{
    print(apiClient.getData(AppConstants.POPULAR_PRODUCT_URL));
     return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);
      }
}