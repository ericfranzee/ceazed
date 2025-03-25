import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:temiwa/application/booking/booking_bloc.dart';
import 'package:temiwa/infrastructure/service/services.dart';
import 'package:temiwa/presentation/components/components.dart';
import 'package:temiwa/presentation/style/theme/theme.dart';

class CouponWidget extends StatefulWidget {
  final CustomColorSet colors;
  final int shopId;

  const CouponWidget({super.key, required this.colors, required this.shopId});

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  final Delayed _delayed = Delayed(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: Icon(
        FlutterRemix.coupon_3_fill,
        color: widget.colors.textBlack,
      ),
      hint: AppHelpers.getTranslation(TrKeys.coupon),
      onChanged: (text) {
        _delayed.run(() {
          context.read<BookingBloc>().add(BookingEvent.checkCoupon(
              context: context, coupon: text.trim(), shopId: widget.shopId));
        });
      },
      suffixIcon: BlocBuilder<BookingBloc, BookingState>(
        buildWhen: (p, n) {
          return p.coupon != n.coupon;
        },
        builder: (context, state) {
          return Icon(
            FlutterRemix.check_double_line,
            color: state.coupon != null
                ? widget.colors.primary
                : widget.colors.textHint,
          );
        },
      ),
    );
  }
}
