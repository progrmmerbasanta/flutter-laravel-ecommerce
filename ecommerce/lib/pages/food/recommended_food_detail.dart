import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/exandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../colors.dart';
import '../../widgets/app_icon.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight:70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon:Icons.clear),
                AppIcon(icon:Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize:Size.fromHeight(20),
              child:Container(
              child: Center(child: BigText(size:Dimensions.font20,text:"Neplease Burger")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
                decoration: BoxDecoration(
                   color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  )
                ),
              )
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset("assets/image/food1.png",
          width: double.maxFinite,
          fit: BoxFit.cover,
          ),
        ),
          ),
          SliverToBoxAdapter(
     child: Column(
     children: [
     Container(
 child: ExpandableTextWidget(text: "The Nepali burger typically consists of a grilled or fried chicken or vegetable patty, served on a sesame seed bun with spicy chutney, sliced onions, tomatoes, and lettuce. The chutney used in Nepali burgers is usually made from tomatoes, chili peppers, and a variety of spices, giving it a distinct, spicy flavor.Burgers at Burger Shack are as good as they come. These American-style burgers are something everyone should try. They are meaty and juicy and come with their secret sauce that will make you crave more. The size of some burgers at one of the best burger places in Kathmandu is quite small, but the taste is simply awesome.The Nepali burger typically consists of a grilled or fried chicken or vegetable patty, served on a sesame seed bun with spicy chutney, sliced onions, tomatoes, and lettuce. The chutney used in Nepali burgers is usually made from tomatoes, chili peppers, and a variety of spices, giving it a distinct, spicy flavor.Burgers at Burger Shack are as good as they come. These American-style burgers are something everyone should try. They are meaty and juicy and come with their secret sauce that will make you crave more. The size of some burgers at one of the best burger places in Kathmandu is quite small, but the taste is simply awesome.The Nepali burger typically consists of a grilled or fried chicken or vegetable patty, served on a sesame seed bun with spicy chutney, sliced onions, tomatoes, and lettuce. The chutney used in Nepali burgers is usually made from tomatoes, chili peppers, and a variety of spices, giving it a distinct, spicy flavor.Burgers at Burger Shack are as good as they come. These American-style burgers are something everyone should try. They are meaty and juicy and come with their secret sauce that will make you crave more. The size of some burgers at one of the best burger places in Kathmandu is quite small, but the taste is simply awesome.The Nepali burger typically consists of a grilled or fried chicken or vegetable patty, served on a sesame seed bun with spicy chutney, sliced onions, tomatoes, and lettuce. The chutney used in Nepali burgers is usually made from tomatoes, chili peppers, and a variety of spices, giving it a distinct, spicy flavor.Burgers at Burger Shack are as good as they come. These American-style burgers are something everyone should try. They are meaty and juicy and come with their secret sauce that will make you crave more. The size of some burgers at one of the best burger places in Kathmandu is quite small, but the taste is simply awesome."),
    margin: EdgeInsets.only(left: Dimensions.width15,right: Dimensions.width20),

              )
             ], 
            )
            ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
       children: [
        Container(
          padding: EdgeInsets.only(
            left: Dimensions.width20*2.5,
            right: Dimensions.width20*2.5,
            top: Dimensions.height10,
            bottom: Dimensions.height10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                iconSize: Dimensions.iconSize24,
                iconColor:Colors.white,
              backgroundColor:AppColors.mainColor,
               icon: Icons.remove),
               BigText(text: "\Rs300.30 "+" X "+" 0 ", color: AppColors.mainBlackColor,size: Dimensions.font26,),
                AppIcon(
                iconSize: Dimensions.iconSize24,
                iconColor:Colors.white,
              backgroundColor:AppColors.mainColor,
               icon: Icons.add),
            ],
          ),
        ),
         Container(
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
              child: Icon(
               Icons.favorite ,
               color: AppColors.mainColor,
               size: 24,
              )
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
       ], 
      ),
    );
    
  }
}