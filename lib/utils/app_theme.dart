import 'package:flutter/material.dart';
import 'package:gososmed_app/core/constant/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gososmed_app/core/constant/styles.dart';

ThemeData getAppTheme(BuildContext _) {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.pink,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      bodyText2: AppStyles.styleTextBody14(),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.grayMedium,
      thickness: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(AppColors.textBlack),
        textStyle: MaterialStateProperty.all(AppStyles.styleTextBody14()),
      ),
    ),
  );
}
