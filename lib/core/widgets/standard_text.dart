
import 'package:flutter/material.dart';
import 'package:karz/core/constants/dimensions.dart';

class StandardText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;

  const StandardText({
    super.key, 
    required this.text, 
    this.color = const Color(0xFFccc7c5),
    this.fontWeight = FontWeight.normal,
    this.fontSize,
    this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: fontSize ?? font14,
        color: color,
        height: 1.2,
        fontWeight: fontWeight,
      ),
    );
  }
}