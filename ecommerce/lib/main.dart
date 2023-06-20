import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/models/products_model.dart';
import 'package:ecommerce/pages/auth/sign_in_page.dart';
import 'package:ecommerce/pages/auth/sign_up_page.dart';
import 'package:ecommerce/pages/cart/cart_page.dart';
import 'package:ecommerce/pages/food/recommended_food_detail.dart';
import 'package:ecommerce/pages/home/food_page_body.dart';
import 'package:ecommerce/pages/home/main_food_page.dart';
import 'package:ecommerce/pages/food/popular_food_detail.dart';
import 'package:ecommerce/pages/splash/spash_page.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();  
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   Get.find<CartController>().getCartData();
 return GetBuilder<PopularProductController>(builder: (_){
return GetBuilder<RecommendedProductController>(builder:(_){
return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SignInpage(),
      //home:SplashScreen(),
     //initialRoute: RouteHelper.getSplashPage(),
      //getPages: RouteHelper.routes,
    );
});
    });
  }
}

