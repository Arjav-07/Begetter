import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        fontFamily:
            GoogleFonts.poppins().fontFamily, // Use Poppins as the font family
        cardColor: Colors.white,
        canvasColor: creamColor,
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepPurple, brightness: Brightness.light)
            .copyWith(
          primary: darkBluishColor,
          secondary: darkBluishColor,
          tertiary: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkBluishColor,
            foregroundColor: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.light().textTheme), // Set text theme to Poppins
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily:
            GoogleFonts.poppins().fontFamily, // Use Poppins as the font family
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepPurple, brightness: Brightness.dark)
            .copyWith(
          primary: Colors.white,
          secondary: lightBluishColor,
          tertiary: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: lightBluishColor, foregroundColor: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.light().textTheme), // Set text theme to Poppins
      );

  // Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
