import 'package:flutter/material.dart';

import 'application_colors.dart';
import 'application_typography.dart';

const InputBorder _defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(3)),
  borderSide: BorderSide(color: ApplicationColors.gray),
);

const InputBorder _errorInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(3)),
  borderSide: BorderSide(color: ApplicationColors.red),
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
      errorMaxLines: 2,
      errorBorder: _errorInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      disabledBorder: _defaultInputBorder,
      focusedErrorBorder: _errorInputBorder,
      errorStyle: ApplicationTypography.titilliumWeb12RegularRed,
      labelStyle: ApplicationTypography.titilliumWeb16RegularGray,
      prefixStyle: ApplicationTypography.titilliumWeb14RegularGray,
      floatingLabelStyle: ApplicationTypography.titilliumWeb16RegularGray,
    ),
  );
}
