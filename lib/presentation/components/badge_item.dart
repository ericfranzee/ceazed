import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:temiwa/app_constants.dart';
import 'package:temiwa/presentation/style/style.dart';

class BadgeItem extends StatelessWidget {
  const BadgeItem({super.key});

  @override
  Widget build(BuildContext context) {
    if (!AppConstants.shopBadge) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: REdgeInsets.only(left: 4),
      child: SvgPicture.asset(
        "assets/svg/badge.svg",
        height: 16.r,
        colorFilter:
            const ColorFilter.mode(CustomStyle.primary, BlendMode.srcIn),
      ),
    );
  }
}
