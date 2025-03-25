import 'package:temiwa/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temiwa/application/products/product_bloc.dart';
import 'package:temiwa/domain/model/response/categories_paginate_response.dart';
import 'package:temiwa/presentation/components/components.dart';
import 'package:temiwa/presentation/route/app_route.dart';
import 'package:temiwa/presentation/style/style.dart';

class SubCategoryItem extends StatelessWidget {
  final CategoryData? categoryData;

  const SubCategoryItem({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () async {
        await AppRoute.goProductList(
            context: context,
            title: categoryData?.translation?.title ?? "",
            categoryId: categoryData?.id);
        if (context.mounted) {
          context.read<ProductBloc>().add(const ProductEvent.updateState());
        }
      },
      child: Container(
        padding: EdgeInsets.all(8.r),
        width: 90.r,
        decoration: BoxDecoration(
            color: CustomStyle.subCategory,
            borderRadius: BorderRadius.circular(AppConstants.radius.r)),
        child: Column(
          children: [
            CustomNetworkImage(
                url: categoryData?.img ?? "", height: 64, width: 64, radius: 8),
            6.verticalSpace,
            Text(
              categoryData?.translation?.title ?? "",
              style:
                  CustomStyle.interNormal(color: CustomStyle.black, size: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
