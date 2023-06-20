
import 'package:ecommerce/base/custom_loader.dart';
import 'package:ecommerce/colors.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/account_widget.dart';
import 'package:ecommerce/widgets/app_icon.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/user_controller.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
 if(_userLoggedIn){
  Get.find<UserController>().getUserInfo();
 }
    return Scaffold(
 appBar: AppBar(
  backgroundColor: AppColors.mainColor,
  title: BigText(
    text:"Profile",size: 24, color: Colors.white,
    ),
 ),
 body: GetBuilder<UserController>(builder:(userController){
return _userLoggedIn?(userController.isLoading?Container(
  width: double.maxFinite,
  margin: EdgeInsets.only(top: Dimensions.height20),
 child: Column(
  children: [
    //profile
    AppIcon(icon: Icons.person,backgroundColor: AppColors.mainColor,
    iconColor: Colors.white,
    iconSize:Dimensions.height45+Dimensions.height30,
    size: Dimensions.height15*10,),
    SizedBox(height: Dimensions.height30,),
    Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //name
        AccountWidget(appIcon: AppIcon(icon: Icons.person,
        backgroundColor: AppColors.mainColor,
        iconColor: Colors.white,
        iconSize:Dimensions.height10*5/2,
        size: Dimensions.height10*5,),
         bigText: BigText(text:userController.userModel.name)
         ),
        SizedBox(height: Dimensions.height30,),
            //phone
        AccountWidget(appIcon: AppIcon(icon: Icons.phone,
        backgroundColor: Colors.green,
        iconColor: Colors.white,
        iconSize:Dimensions.height10*5/2,
        size: Dimensions.height10*5,),
         bigText: BigText(text:userController.userModel.phone)
         ),
        SizedBox(height: Dimensions.height30,),
        // email
        AccountWidget(appIcon: AppIcon(icon: Icons.email,
        backgroundColor: Colors.yellow,
        iconColor: Colors.white,
        iconSize:Dimensions.height10*5/2,
        size: Dimensions.height10*5,),
         bigText: BigText(text:userController.userModel.email)
         ),
        SizedBox(height: Dimensions.height30,),
        //address
        AccountWidget(appIcon: AppIcon(icon: Icons.location_on,
        backgroundColor:Colors.lightBlue,
        iconColor: Colors.white,
        iconSize:Dimensions.height10*5/2,
        size: Dimensions.height10*5,),
         bigText: BigText(text: "Fill your Address",)
         ),
        SizedBox(height: Dimensions.height30,),
        //message
        AccountWidget(appIcon: AppIcon(icon: Icons.message,
        backgroundColor: Colors.blueGrey,
        iconColor: Colors.white,
        iconSize:Dimensions.height10*5/2,
        size: Dimensions.height10*5,),
         bigText: BigText(text: "Message",)
         ),
        SizedBox(height: Dimensions.height30,),
        //logout
      GestureDetector(
    onTap: () {
      if(Get.find<AuthController>().userLoggedIn()){
   Get.find<AuthController>().clearSharedData();
   Get.find<CartController>().clear();
   Get.find<CartController>().clearCartHistory();
   Get.offNamed(RouteHelper.getSignInPage());
      }else{
        print("you logged out");
      }
    },
    child:AccountWidget(appIcon: AppIcon(icon: Icons.logout,
        backgroundColor:Colors.red,
        iconColor: Colors.white,
        iconSize:Dimensions.height10*5/2,
        size: Dimensions.height10*5,),
         bigText: BigText(text: "Logout",)
         ),
      ),
        SizedBox(height: Dimensions.height30,),
          ],
        ),
      ),
    )
  ],
 ),
 ):CustomLoader()):
 Container( child: Center(
    child:Column(
      mainAxisAlignment:MainAxisAlignment.center ,
      children: [
Container(
      width: double.maxFinite,
      height: Dimensions.height20*8,
      margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/image/signintocontinue.png"
          ))
      ),
    ),
    GestureDetector(
      onTap:() {
     Get.toNamed(RouteHelper.getSignInPage());
      },
      child: Container(
        width: double.maxFinite,
        height: Dimensions.height20*5,
        margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        child: Center(child: BigText(text: "Sign in",color: Colors.white,size:Dimensions.font20)),
      ),
    )
    ],
    )));
 }),
    );
  }
}