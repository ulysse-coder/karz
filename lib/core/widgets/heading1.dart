import 'package:flutter/material.dart';
import 'package:karz/core/constants/dimensions.dart';

class Heading1 extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const Heading1({
    super.key, 
    required this.text, 
    this.color = const Color(0xff302f3c),
    this.fontWeight = FontWeight.bold,
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
        fontSize: font24,
        color: color,
        fontWeight: fontWeight
      ),
      // overflow: TextOverflow.ellipsis,
    );
  }
}