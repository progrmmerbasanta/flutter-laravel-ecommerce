import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/colors.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_product_controller.dart';
import 'package:ecommerce/models/products_model.dart';
import 'package:ecommerce/pages/food/popular_food_detail.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_column.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/icon_and_text_widget.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor= 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;
      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     GetBuilder<PopularProductController>(builder:(popularProducts){
      return popularProducts.isLoaded?Container(
      //color:Colors.redAccent,5
      height: Dimensions.pageView,
      child: PageView.builder(
        controller: pageController,
        itemCount: popularProducts.popularProductList.length,
        //itemCount:6,
        itemBuilder: (context,position){
        return _buildPageItem(position, popularProducts.popularProductList[position]);
      }
      ),
    
    ):CircularProgressIndicator(
       color:AppColors.mainColor,
     
    );
     }),
    GetBuilder<PopularProductController>(builder:(popularProducts){
      return DotsIndicator(
 dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
 // dotsCount: 6,
  position: _currPageValue,
  decorator: DotsDecorator(
    activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
);
    }),
//popular text
 SizedBox(height: Dimensions.height30,),
 Container(
  margin: EdgeInsets.only(left: Dimensions.width30),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      BigText(text: "Recommended"),
      SizedBox(width: Dimensions.width10,),
      Container(
        margin: const EdgeInsets.only(bottom: 3),
         child: BigText(text: ".", color: Colors.black26,),
      ),
        SizedBox(width: Dimensions.width10,),
        Container(
            margin: const EdgeInsets.only(bottom: 2),
          child: SmallText(text: "Food pairing",),
        )
    ],
  ),
 ),
 //List of food and images
 GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
  return recommendedProduct.isLoaded? ListView.builder(
    physics: NeverScrollableScrollPhysics(),
   shrinkWrap: true,
  itemCount: recommendedProduct.recommendedProductList.length,
  itemBuilder: (context,index){
     return  GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.getRecommendedFood(index));
      },
       child: Container(
        margin: EdgeInsets.only(left:Dimensions.width20,right:Dimensions.width20,bottom:Dimensions.height10 ),
        child: Row(
          children: [
            Container(
              width: Dimensions.ListViewImgSize,
              height: Dimensions.ListViewImgSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white38,
                image: DecorationImage(
                  fit:BoxFit.cover,
                    image: NetworkImage(
             AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!,
              )
                  )
              ),
            ),
            //text container
            Expanded(
              child: Container(
                height: Dimensions.ListViewTextContSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    bottomRight: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:EdgeInsets.only(left:Dimensions.width10,right: Dimensions.width10 ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(text:recommendedProduct.recommendedProductList[index].name!),
                      SizedBox(height: Dimensions.height10,),
                      SmallText(text: "With Neplease Characteristics"),
                      SizedBox(height: Dimensions.height10,),
                     Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    IconAndTextWidget(icon: Icons.circle_sharp,
                     text: "Normal",
                      iconColor: AppColors.iconColor1),
                      IconAndTextWidget(icon: Icons.location_on,
                     text: "1.7km",
                      iconColor: AppColors.mainColor),
                      IconAndTextWidget(icon: Icons.access_time_rounded,
                     text: "30min",
                      iconColor: AppColors.iconColor2),
                  ],)
                    ],
                  ),
                  ),
              ),
            )
          ],
        ),
     
       ),
     );
  }):CircularProgressIndicator(
    color: AppColors.mainColor,
  );
 })
 
      ],
    );
  }
  Widget _buildPageItem(int index, ProductModel popularProduct){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans , 0);
    } else if (index ==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
       var currTrans =_height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans , 0);
    } else if (index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
     var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans , 0);
    }else{
      var currScale = 0.8;
       matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2,1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
             onTap: () {

           Get.toNamed(RouteHelper.getPopularFood(index));
             },
            child: Container (
                  height: Dimensions.pageViewContainer,
                  margin:EdgeInsets.only(left:Dimensions.width10 , right:Dimensions.width10),
                  decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color:index.isEven? Color(0xFF69c5df): Color(0xFF9294cc),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
               AppConstants.BASE_URL+ AppConstants.UPLOAD_URL+popularProduct.img!
          
              )
            )
                  ),
                ),
          ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container (
          height: Dimensions.pageViewTextContainer,
          margin:EdgeInsets.only(left:Dimensions.width30, right:Dimensions.width30, bottom: Dimensions.height30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            color:Colors.white,
            boxShadow: [
               BoxShadow(
                color:  Color(0xFFe8e8e8),
                blurRadius: 5.0,
                offset: Offset(0,5),
               ),
               BoxShadow(
                color: Colors.white,
                offset: Offset(-5,0)
               ),
                BoxShadow(
                color: Colors.white,
                offset: Offset(5,0)
               )
            ]
          ),
          child: Container(
            padding: EdgeInsets.only(top:Dimensions.height15,left:15,right:15),
            child: AppColumn(text:popularProduct.name!),
          ),
        ),
      )
        ],
      ),
    );   
  }
}