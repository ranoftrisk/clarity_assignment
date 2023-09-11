import 'package:clarity_assignment/utils/styles.dart';
import 'package:flutter/material.dart';

class CardDataColumn extends StatelessWidget {
  const CardDataColumn({super.key, required this.headline, required this.bottom});

  final String headline;
  final Widget bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headline, style: Styles.headlineTextStyle,),
        bottom,
      ],
    );
  }
}
