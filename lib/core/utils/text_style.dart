import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleText {
  const StyleText();

  static TextStyle popBold = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
  );

  static TextStyle popRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
  );
  static TextStyle popMedium = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
  );

  static TextStyle popSemiBold = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
  );


  static TextStyle montBold = GoogleFonts.montserrat(
    fontWeight: FontWeight.w700,
  );

  static TextStyle montSemiBold = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
  );

  static TextStyle montMedium = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
  );

  static TextStyle montRegular = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400,
  );

  static TextStyle montLight = GoogleFonts.montserrat(
    fontWeight: FontWeight.w300,
  );
}
