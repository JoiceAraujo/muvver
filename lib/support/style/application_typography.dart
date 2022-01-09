import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'application_colors.dart';

class ApplicationTypography {
  static final TextStyle titilliumWeb20SemiBoldWhite = GoogleFonts.titilliumWeb(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ApplicationColors.white,
  );

  static final TextStyle titilliumWeb14RegularWhite = GoogleFonts.titilliumWeb(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ApplicationColors.white,
  );

  static final TextStyle titilliumWeb16Regular = GoogleFonts.titilliumWeb(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ApplicationColors.gray,
  );

  static final TextStyle titilliumWeb20Regular = GoogleFonts.titilliumWeb(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ApplicationColors.darkGray,
  );
}
