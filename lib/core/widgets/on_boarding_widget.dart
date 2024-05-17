import 'package:flutter/material.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/core/constants/dimensions.dart';
import 'package:ulysse_app/core/widgets/heading1.dart';
import 'package:ulysse_app/core/widgets/standard_text.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingW20),
      decoration: const BoxDecoration(
        color: primary
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [primary, fontColor],
        // )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          SizedBox(height: height45*2,),
          Heading1(
            text: title,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height16,),
          StandardText(
            text: description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
