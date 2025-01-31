import 'package:begetter/pages/login_page.dart';
import 'package:begetter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:begetter/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyRoutes.HomeRoute, // Set initial route to be LoginPage
      themeMode: ThemeMode.dark, // Dark theme as default
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily, // Use Lato font family
        textTheme: GoogleFonts.latoTextTheme(), // Apply Lato font to textTheme
      ),

      debugShowCheckedModeBanner: false,  // Removing debug banner

      darkTheme: ThemeData(brightness: Brightness.light),
      routes: {
        '/': (context) => const LoginPage(),
        MyRoutes.HomeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}
