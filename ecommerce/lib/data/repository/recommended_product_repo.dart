import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  Future<Response> getRecommendedProductList() async {
    const recommendedProductUrl =
        'https://7744-103-146-219-179.ngrok-free.app/api/viewproducts_details';
    print(apiClient.getData(recommendedProductUrl));
    return await apiClient.getData(recommendedProductUrl);
  }
}
