import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../colors.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String SecondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight/5.63;
  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      SecondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf = widget.text;
      SecondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SecondHalf.isEmpty?SmallText(color:AppColors.paraColor,size:Dimensions.font16, text: firstHalf):Column(
     children: [
      SmallText(height: 1.8,color:AppColors.paraColor,size:Dimensions.font16,text:hiddenText?(firstHalf+"..."):(firstHalf+SecondHalf)),
      InkWell(
        onTap:(){
         setState(() {
           hiddenText = !hiddenText;
         });
        },
        child: Row(
          children: [
            SmallText(text: "Show more",size: Dimensions.font16, color: AppColors.mainColor,),
            Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.mainColor,)
          ]),
      )
     ],
      ),
    );
    
  }
}