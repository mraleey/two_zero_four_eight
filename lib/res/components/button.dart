import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:two_zero_four_eight/res/components/size.dart';

import 'app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? press;
  final bool? isIcon;
  final String? icon;
  final Color? color;
  final Color? iconColor;
  final double? widthValue;

  const CustomButton(
      {super.key,
      this.text,
      this.icon,
      this.isIcon = false,
      this.color = kPrimaryColor,
      this.iconColor = kDarkColor,
      @required this.widthValue,
      this.press});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getScreenWidth(widthValue!),
      height: getScreenHeight(45),
      child: ElevatedButton.icon(
        icon: isIcon!
            ? SvgPicture.asset(icon!,
                colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn))
            : const SizedBox(),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: press,
        label: Text(
          text!,
          style: Get.textTheme.titleMedium!
              .copyWith(fontWeight: FontWeight.w700, color: kWhiteColor),
        ),
      ),
    );
  }
}
