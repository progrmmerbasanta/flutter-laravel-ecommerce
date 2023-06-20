import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 //print("I am printing Loading state"+Get.find<AuthController>().isLoading.toString());
    return Center(
      child: Container(
height: Dimensions.height20*5,
width: Dimensions.height20*5,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(Dimensions.height20*5/2),
  color: AppColors.mainColor,
),
alignment: Alignment.center,
child: CircularProgressIndicator(color:Colors.white,),
      ),
    );
  }
}