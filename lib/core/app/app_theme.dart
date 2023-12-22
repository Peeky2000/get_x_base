import 'package:flutter/material.dart';
import 'package:ebook_name/core/app/app.dart';
import 'package:ebook_name/generated/fonts.gen.dart';

class AppTheme {
  ThemeData get lightTheme {
    final textTheme = ThemeData.light().textTheme;
    return ThemeData.light().copyWith(
      textTheme: TextTheme(
        displayLarge: textTheme.displayLarge?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        displayMedium: textTheme.displayMedium?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        displaySmall: textTheme.displaySmall?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        headlineLarge: textTheme.headlineLarge?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        headlineMedium: textTheme.headlineMedium?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        headlineSmall: textTheme.headlineSmall?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        titleLarge: textTheme.titleLarge?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        titleMedium: textTheme.titleMedium?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        titleSmall: textTheme.titleSmall?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        bodyLarge: textTheme.bodyLarge?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        bodyMedium: textTheme.bodyMedium?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        bodySmall: textTheme.bodySmall?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        labelLarge: textTheme.labelLarge?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        labelMedium: textTheme.labelMedium?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        labelSmall: textTheme.labelSmall?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.0,
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: Color(0xFF5C5C5C),
        ),
        titleTextStyle:
            App.appStyle?.semiBold18?.copyWith(color: const Color(0xFF505050)),
      ),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      primaryColor: const Color(0xFF2BCB57),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: const Color(0xFF379237),
          selectionColor: const Color(0xFF2BCB57).withOpacity(0.56),
          selectionHandleColor: const Color(0xFF2BCB57)),
      chipTheme: const ChipThemeData(
        selectedColor: Color(0xFF2BCB57),
        backgroundColor: Colors.white,
      ),
      dividerTheme: const DividerThemeData(color: Color(0xFFCECECE)),
    );
  }

  ThemeData get darkTheme {
    final textTheme = ThemeData.dark().textTheme;
    return ThemeData.dark().copyWith(
      textTheme: TextTheme(
        displayLarge: textTheme.displayLarge?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        displayMedium: textTheme.displayMedium?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        displaySmall: textTheme.displaySmall?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        headlineLarge: textTheme.headlineLarge?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        headlineMedium: textTheme.headlineMedium?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        headlineSmall: textTheme.headlineSmall?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        titleLarge: textTheme.titleLarge?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        titleMedium: textTheme.titleMedium?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        titleSmall: textTheme.titleSmall?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        bodyLarge: textTheme.bodyLarge?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        bodyMedium: textTheme.bodyMedium?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        bodySmall: textTheme.bodySmall?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        labelLarge: textTheme.labelLarge?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        labelMedium: textTheme.labelMedium?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
        labelSmall: textTheme.labelSmall?.copyWith(
            fontFamily: FontFamily.philosopher, color: const Color(0xFF505050)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.0,
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: Color(0xFF5C5C5C),
        ),
        titleTextStyle:
            App.appStyle?.semiBold18?.copyWith(color: const Color(0xFF505050)),
      ),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      primaryColor: const Color(0xFF2BCB57),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: const Color(0xFF379237),
          selectionColor: const Color(0xFF2BCB57).withOpacity(0.56),
          selectionHandleColor: const Color(0xFF2BCB57)),
      chipTheme: const ChipThemeData(
        selectedColor: Color(0xFF2BCB57),
        backgroundColor: Colors.white,
      ),
      dividerTheme: const DividerThemeData(color: Color(0xFFCECECE)),
    );
  }
}
