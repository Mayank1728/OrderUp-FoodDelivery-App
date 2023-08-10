import 'package:app/utils/colors.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  double textHeight = Dimensions.screenHeight/5;
  bool show2ndHalf = false;
  @override
  void initState(){
    super.initState();
    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: SingleChildScrollView(
      child: Container(
        child: secondHalf.isEmpty? SmallText(text: firstHalf, color: AppColors.paraColor,): Container(
          child: Column(
              children: [
                Container(
                  child: show2ndHalf == false ? SmallText(height: 1.65, text: firstHalf + "...", color: AppColors.paraColor,): SmallText(height: 1.65, text: firstHalf + secondHalf, color: AppColors.paraColor,),
                ),
                SizedBox(height: Dimensions.height5,),
                InkWell(
                    onTap: (){
                      setState(() {
                        show2ndHalf = !show2ndHalf;
                      });
                    },
                    child: show2ndHalf == true ? Row(
                      children: [
                        SmallText(text: "Show less", color: AppColors.mainColor,),
                        Icon(Icons.arrow_drop_up_sharp, color: AppColors.mainColor,)
                      ],
                    ) : Row(
                      children: [
                        SmallText(text: "Show more", color: AppColors.mainColor,),
                        Icon(Icons.arrow_drop_down_sharp, color: AppColors.mainColor,)
                      ],
                    )
                ),
              ]),
        ),
      ),
    ));
  }
}
