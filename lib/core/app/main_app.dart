import 'package:ebook_name/generated/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ebook_name/core/app/app.dart';
import 'package:ebook_name/core/common/constant.dart';
import 'package:ebook_name/core/common/route.dart';
import 'package:ebook_name/core/helper/network/network_checker.dart';
import 'package:ebook_name/generated/locales.g.dart';
import 'package:sli_common/l10n/arb/app_localizations.dart'
    as sliCommonLocalization;
import 'package:sli_common/sli_common.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  void _initDefault() {
    // setup some default
    DialogUtil.defaultTitle = LocaleKeys.notification.tr;
    DialogUtil.defaultTitleError = LocaleKeys.error.tr;
    DialogUtil.confirmStyle = App.appStyle?.medium16?.copyWith(
      color: App.appColor?.primaryColor,
    );
    DialogUtil.cancelStyle = App.appStyle?.medium16?.copyWith(
      color: Colors.black,
    );
    TitleWidget.defaultTitleStyle =
        App.appStyle?.medium24?.copyWith(color: App.appColor?.textColor);
    TitleWidget.defaultValueStyle =
        App.appStyle?.medium14?.copyWith(color: App.appColor?.secondary1);
    MoneyWidget.unitDefault = ' đ';

    CommonTextField.commonTextFieldStyle = CommonTextFieldStyle(
      titleStyle: App.appStyle?.medium18?.copyWith(
        color: App.appColor?.gray700,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.proximaNova,
      ),
      labelStyle: App.appStyle?.medium16?.copyWith(
        color: App.appColor?.grayScale500,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.philosopher,
      ),
      hintStyle: App.appStyle?.medium16?.copyWith(
        color: App.appColor?.grayScale300,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.philosopher,
      ),
      errorStyle: App.appStyle?.medium10?.copyWith(
        color: App.appColor?.redBase,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12.0.w,
        vertical: 8.0.h,
      ),
      noteStyle: App.appStyle?.medium16?.copyWith(
        color: App.appColor?.redBase,
      ),
      borderColor: App.appColor?.borderColor,
      enableBorderColor: App.appColor?.borderColor,
      disableBorderColor: App.appColor?.borderColor,
      focusedBorderColor: App.appColor?.primaryColor,
      focusedErrorBorderColor: App.appColor?.redBase,
      errorBorderColor: App.appColor?.redBase,
      borderRadius: kRadiusTextField,
    );
    BaseField.baseFieldStyle = BaseFieldStyle(
      titleDefaultStyle:
          App.appStyle?.medium10?.copyWith(color: App.appColor?.textColorLight),
      valueDefaultStyle:
          App.appStyle?.medium14?.copyWith(color: App.appColor?.textColor),
    );

    CommonDropDown.commonDropDownStyle = CommonDropDownStyle(
      borderColor: App.appColor?.borderColor,
      disableBorderColor: App.appColor?.borderColor,
      hintStyle: App.appStyle?.medium12?.copyWith(
        color: App.appColor?.textColorLight,
      ),
      titleStyle: App.appStyle?.medium12?.copyWith(
        color: App.appColor?.textColorLight,
      ),
      valueStyle: App.appStyle?.medium12?.copyWith(
        color: App.appColor?.textColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
    );
  }

  void _setupListen() {
    Get.find<NetworkChecker>().isConnected.listen((value) async {
      // if (!DialogUtil.isShowingFlushBar) {
      if (value) {
        await DialogUtil.showFlushBar(
            Get.context!, LocaleKeys.connectionRestored.tr,
            iconFlushBar: const Icon(
              Icons.wifi_rounded,
              color: Colors.white,
            ));
      } else {
        await DialogUtil.showFlushBar(
            Get.context!, LocaleKeys.noInternetShort.tr,
            backgroundColor: Colors.redAccent,
            iconFlushBar: const Icon(
              Icons.wifi_off_rounded,
              color: Colors.white,
            ));
      }
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 816),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          App.init();
          return GetMaterialApp(
            builder: (context, widget) {
              _initDefault();
              _setupListen();
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!);
            },
            debugShowCheckedModeBanner: false,
            translationsKeys: AppTranslation.translations,
            locale: const Locale('vi', 'VN'),
            fallbackLocale: const Locale('vi', 'VN'),
            title: 'EBook Orbit',
            theme: App.theme?.lightTheme,
            darkTheme: App.theme?.darkTheme,
            themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: const [
              sliCommonLocalization.AppLocalizations.delegate,
              // ServerMessageLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            getPages: AppPage.pages,
            initialRoute: AppPage.SIGN_IN,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('vi', 'VN'),
            ],
          );
        },
      ),
    );
  }
}
