import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/fonts.dart';
import 'app_colors.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final List<String> subtitles;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final double elevation;
  final double? height;
  final double? width;
  final double? titleSize;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitles,
    this.backgroundColor,
    this.titleColor,
    this.subtitleColor,
    this.elevation = 2.0,
    this.height,
    this.width,
    this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: backgroundColor ?? kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize:
                        titleSize ?? CustomFontSize.extraExtraLarge(context),
                    fontWeight: FontWeight.bold,
                    color: titleColor ?? kDarkColor,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 40),
              Column(
                children: subtitles.map((subtitle) {
                  return Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      subtitle,
                      style: TextStyle(
                        fontSize: CustomFontSize.extraLarge(context),
                        color: subtitleColor ?? kCardBgColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
