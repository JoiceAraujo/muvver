import 'package:flutter/material.dart';

import 'application_colors.dart';
import 'application_typography.dart';

class ApplicationThemes {
  static final ThemeData theme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ApplicationColors.green,
        fixedSize: const Size.fromHeight(48),
        textStyle: ApplicationTypography.titilliumWeb16BoldWhite,
      ),
    ),
  );
}
