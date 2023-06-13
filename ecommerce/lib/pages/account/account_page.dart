import 'package:ecommerce/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/account_widget.dart';
import 'package:ecommerce/widgets/app_icon.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
  backgroundColor: AppColors.mainColor,
  title: BigText(
    text:"Profile",size: 24, color: Colors.white,
    ),
 ),
 body: Container(
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
         bigText: BigText(text: "Ahmed",)
         ),
        SizedBox(height: Dimensions.height30,),
        //  phone
        AccountWidget(appIcon: AppIcon(icon: Icons.phone,
        backgroundColor: Colors.green,
        iconColor: Colors.white,
        iconSize:Dimensions.height10*5/2,
        size: Dimensions.height10*5,),
         bigText: BigText(text: "9816169844",)
         ),
        SizedBox(height: Dimensions.height30,),
        //email
        AccountWidget(appIcon: AppIcon(icon: Icons.email,
        backgroundColor: AppColors.yellowColor,
        iconColor: Colors.white,
        iconSize:Dimensions.height10*5/2,
        size: Dimensions.height10*5,),
         bigText: BigText(text: "karki@11gmail.com",)
         ),
        SizedBox(height: Dimensions.height30,),
        //address
        AccountWidget(appIcon: AppIcon(icon: Icons.location_on,
        backgroundColor: Colors.redAccent,
        iconColor: Colors.white,
        iconSize:Dimensions.height10*5/2,
        size: Dimensions.height10*5,),
         bigText: BigText(text: "Fill in your address",)
         ),
        SizedBox(height: Dimensions.height30,),
        //message
        AccountWidget(appIcon: AppIcon(icon: Icons.message,
        backgroundColor:Colors.blueGrey,
        iconColor: Colors.white,
        iconSize:Dimensions.height10*5/2,
        size: Dimensions.height10*5,),
         bigText: BigText(text: "Message",)
         ),
        SizedBox(height: Dimensions.height30,),
          ],
        ),
      ),
    )
  ],
 ),
 ),
    );
  }
}