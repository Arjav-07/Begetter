import 'package:begetter/pages/home_detail_page.dart';
import 'package:begetter/pages/home_page.dart';
import 'package:begetter/pages/login_page.dart';
import 'package:begetter/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:begetter/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark, // Dark theme as default
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: '/', // Now LoginPage is the default
      debugShowCheckedModeBanner: false, // Remove debug banner
      routes: {
        '/': (context) => HomePage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}
