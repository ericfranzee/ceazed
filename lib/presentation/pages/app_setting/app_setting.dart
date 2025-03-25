import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temiwa/domain/di/dependency_manager.dart';
import 'package:temiwa/infrastructure/service/services.dart';
import 'package:temiwa/infrastructure/local_storage/local_storage.dart';
import 'package:temiwa/presentation/components/components.dart';
import 'package:temiwa/presentation/pages/profile/widgets/button_item.dart';
import 'package:temiwa/presentation/route/app_route.dart';
import 'package:temiwa/presentation/route/app_route_setting.dart';
import 'package:temiwa/presentation/style/style.dart';
import 'package:temiwa/presentation/style/theme/theme.dart';
import 'package:temiwa/presentation/style/theme/theme_wrapper.dart';

class AppSettingPage extends StatefulWidget {
  const AppSettingPage({super.key});

  @override
  State<AppSettingPage> createState() => _AppSettingPageState();
}

class _AppSettingPageState extends State<AppSettingPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        child: Column(
          children: [
            Text(
              AppHelpers.getTranslation(TrKeys.appSetting),
              style: CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
            ),
            24.verticalSpace,
            ButtonItem(
                icon: FlutterRemix.global_line,
                title: AppHelpers.getTranslation(TrKeys.language),
                selectValue: LocalStorage.getLanguage()?.title,
                onTap: () {
                  AppRouteSetting.goLanguage(context: context);
                },
                colors: colors),
            ButtonItem(
                icon: FlutterRemix.money_dollar_circle_line,
                title: AppHelpers.getTranslation(TrKeys.currency),
                selectValue: LocalStorage.getSelectedCurrency()?.symbol,
                onTap: () {
                  AppRouteSetting.goCurrency(context: context);
                },
                colors: colors),
            ThemeWrapper(builder: (colors, controller) {
              return ButtonItem(
                  icon: FlutterRemix.sun_line,
                  title: AppHelpers.getTranslation(TrKeys.appTheme),
                  onTap: () {
                    controller.toggle();
                  },
                  value: !controller.mode.isDark,
                  colors: colors);
            }),
            ButtonItem(
                icon: FlutterRemix.notification_line,
                title: AppHelpers.getTranslation(TrKeys.getNotification),
                onTap: () async {
                  if (LocalStorage.getToken().isNotEmpty) {
                    await userRepository.updateNotification(
                        notifications: LocalStorage.getUser().notification);
                    if (context.mounted) {
                      final res =
                          await userRepository.getProfileDetails(context);
                      res.fold(
                        (l) {
                          LocalStorage.setUser(l.data);
                          setState(() {});
                        },
                        (r) => debugPrint(r),
                      );
                    }
                  }
                },
                value: ((LocalStorage.getUser().notification?.isNotEmpty ??
                            false)
                        ? (LocalStorage.getUser().notification?.first.active ??
                            1)
                        : 1) ==
                    1,
                onTitle: AppHelpers.getTranslation(TrKeys.on),
                offTitle: AppHelpers.getTranslation(TrKeys.off),
                colors: colors),
          ],
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingButton: (colors) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Row(
          children: [
            PopButton(colors: colors),
            const Spacer(),
            ButtonEffectAnimation(
              onTap: () {
                if (LocalStorage.getToken().isEmpty) {
                  AppRoute.goLogin(context);
                  return;
                }
                AppRouteSetting.goChat(
                  context: context,
                  senderId: LocalStorage.getAdminId(),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 22.r, horizontal: 28.r),
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FlutterRemix.message_3_fill,
                      color: colors.white,
                    ),
                    10.horizontalSpace,
                    Text(
                      AppHelpers.getTranslation(TrKeys.onlineChat),
                      style: CustomStyle.interNoSemi(
                          color: CustomStyle.white, size: 16),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
