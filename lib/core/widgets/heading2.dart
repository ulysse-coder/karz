import 'package:flutter/material.dart';
import 'package:karz/core/constants/dimensions.dart';

class Heading2 extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const Heading2({
    super.key, 
    required this.text, 
    this.color = const Color(0xff302f3c),
    this.fontWeight = FontWeight.normal,
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
        fontSize: font20,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}