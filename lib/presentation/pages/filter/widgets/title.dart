import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temiwa/application/filter/filter_bloc.dart';
import 'package:temiwa/infrastructure/service/services.dart';
import 'package:temiwa/presentation/components/components.dart';
import 'package:temiwa/presentation/style/style.dart';
import 'package:temiwa/presentation/style/theme/theme.dart';

class TitleScreen extends StatelessWidget {
  final CustomColorSet colors;

  const TitleScreen({
    super.key,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppHelpers.getTranslation(TrKeys.filter),
          style: CustomStyle.interNoSemi(color: colors.textBlack, size: 22),
        ),
        ButtonEffectAnimation(
          onTap: () {
            context.read<FilterBloc>()
              ..add(const FilterEvent.clearFilter())
              ..add(FilterEvent.fetchExtras(context: context, isPrice: true));
          },
          child: Text(
            AppHelpers.getTranslation(TrKeys.clearAll),
            style: CustomStyle.interNormal(color: colors.textBlack, size: 14),
          ),
        ),
      ],
    );
  }
}
