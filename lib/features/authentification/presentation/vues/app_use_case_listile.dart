import 'package:flutter/material.dart';
import 'package:karz/core/constants/colors.dart';
import 'package:karz/core/constants/dimensions.dart';
import 'package:karz/core/widgets/heading2.dart';
import 'package:karz/core/widgets/standard_text.dart';

class AppUseCaseListTile extends StatelessWidget {
  const AppUseCaseListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.callback
  });

  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: paddingH10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius15),
      ),
      child: ListTile(
        onTap: callback,
        title: Heading2(
          text: title,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
        leading: Icon(leadingIcon, color: secondary,),
        subtitle: StandardText(
          text: subtitle,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right_outlined,
          color: secondary,
        ),
      ),
    );
  }
}
