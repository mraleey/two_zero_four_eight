import 'package:flutter/material.dart';

import '../constants/fonts.dart';
import 'app_colors.dart';

class CustomDesignCard extends StatelessWidget {
  final String imgName;
  final String heading;
  final String baseLine;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? dividerColor;
  final Color? baseLineColor;
  final bool? isLoading;

  const CustomDesignCard({
    super.key,
    required this.imgName,
    required this.heading,
    required this.baseLine,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    this.dividerColor,
    this.isLoading,
    this.baseLineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Card(
            color: backgroundColor ?? kSecondaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: isLoading == true
                ? const LinearProgressIndicator()
                : Image.asset(
                    'assets/images/$imgName.png',
                    height: 150.0,
                    width: 150.0,
                    color: iconColor ?? kWhiteColor,
                  ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          heading,
          style: TextStyle(
            color: baseLineColor ?? kDarkColor,
            fontSize: CustomFontSize.extraLarge(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          baseLine,
          style: TextStyle(
            color: baseLineColor ?? kDarkColor,
            fontSize: CustomFontSize.large(context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
