import 'package:begetter/login_page.dart';
import 'package:begetter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/login', // Set initial route to be LoginPage
        themeMode: ThemeMode.dark, // Dark theme as default
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily, // Use Lato font family
          textTheme:
              GoogleFonts.latoTextTheme(), // Apply Lato font to textTheme
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark, // Apply dark theme
        ),
        routes: {
          "/": (context) => LoginPage(),
          "/home": (context) => HomePage(),
          "/login": (context) => LoginPage()
        });
  }
}
