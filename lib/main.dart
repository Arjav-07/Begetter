import 'package:begetter/login_page.dart';
import 'package:begetter/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Set initial route to be LoginPage
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.light),
      routes: {
        '/': (context) => LoginPage(),  // "/" denotes the page which is going to be displayed at top
        '/home': (context) => HomePage(),  // Navigate to HomePage via '/home'
        '/login': (context) => LoginPage(),  // LoginPage is initial screen
      },
    );
  }
}
