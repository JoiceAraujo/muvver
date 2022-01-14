import 'package:flutter/material.dart';

import 'application_colors.dart';
import 'application_typography.dart';

const InputBorder _defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(3)),
  borderSide: BorderSide(color: ApplicationColors.gray),
);

class ApplicationThemes {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: ApplicationColors.ice,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ApplicationColors.green,
        fixedSize: const Size.fromHeight(48),
        textStyle: ApplicationTypography.titilliumWeb16BoldWhite,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      disabledBorder: _defaultInputBorder,
      labelStyle: ApplicationTypography.titilliumWeb16RegularGray,
      prefixStyle: ApplicationTypography.titilliumWeb14RegularGray,
      floatingLabelStyle: ApplicationTypography.titilliumWeb16RegularGray,
    ),
  );
}
