import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_column.dart';
import 'package:ecommerce/widgets/exandable_text_widget.dart';
import 'package:flutter/material.dart';
//import 'dart:html';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child:Container(
              width: double.maxFinite,
              height: Dimensions.poularFoodImgSize,
              decoration: BoxDecoration(
                image:DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/image/food1.png"
                  ))
              )
             
          ) ),
          //icon widgets
          Positioned(
            top: Dimensions.height45,
            left:Dimensions.width20,
            right:Dimensions.width20,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon:Icons.arrow_back_ios),
                AppIcon(icon:Icons.shopping_cart_outlined)

              ],
          )),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.poularFoodImgSize-20,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top:Dimensions.height20),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         AppColumn(text:"Neplease Burger"),
      SizedBox(height: Dimensions.height20,),
     BigText(text:"Introduce"),
     SizedBox(height: Dimensions.height20,),
   Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "The Nepali burger typically consists of a grilled or fried chicken or vegetable patty, served on a sesame seed bun with spicy chutney, sliced onions, tomatoes, and lettuce. The chutney used in Nepali burgers is usually made from tomatoes, chili peppers, and a variety of spices, giving it a distinct, spicy flavor.Burgers at Burger Shack are as good as they come. These American-style burgers are something everyone should try. They are meaty and juicy and come with their secret sauce that will make you crave more. The size of some burgers at one of the best burger places in Kathmandu is quite small, but the taste is simply awesome."))),
                                                   
              ],
              ),
          )), 
        ],
      ),
      bottomNavigationBar: Container(
        height:Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30,bottom:Dimensions.height30,left: Dimensions.width20,right:Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(

            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,bottom:Dimensions.height20,left: Dimensions.width20,right:Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove,color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: "0"),
               SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add, color:AppColors.signColor,),
                ]),
            ),
            Container(
                 padding: EdgeInsets.only(top: Dimensions.height20,bottom:Dimensions.height20,left: Dimensions.width20,right:Dimensions.width20),
              child: BigText(text:"\RS100 | Add to cart",color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor
              ),
            )
          ]
          ),
      ),
    );
    
  }
}