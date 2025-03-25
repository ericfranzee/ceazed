import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temiwa/domain/model/model/product_model.dart';
import 'package:temiwa/presentation/components/components.dart';

import 'package:temiwa/presentation/route/app_route.dart';
import 'package:temiwa/presentation/style/style.dart';
import 'package:temiwa/presentation/style/theme/theme.dart';

class TitleCompare extends StatelessWidget {
  final CustomColorSet colors;
  final ProductData product;

  const TitleCompare({super.key, required this.colors, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRoute.goProductPage(context: context, product: product);
      },
      child: Column(
        children: [
          CustomNetworkImage(
              url: product.img ?? "", height: 60, width: 50, radius: 0),
          8.verticalSpace,
          SizedBox(
            height: 60.r,
            child: Text(
              product.translation?.title ?? "",
              style: CustomStyle.interNormal(color: colors.textBlack),
            ),
          )
        ],
      ),
    );
  }
}
