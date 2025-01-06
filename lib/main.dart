<<<<<<< HEAD
import 'package:begetter/login_page.dart';
import 'package:begetter/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

=======
import 'package:begetter/home_page.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
>>>>>>> 1b48be7ea24a1563cedbe4318c6feefe5d749a3b
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      initialRoute: '/', // Set initial route to be LoginPage
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.light),
      routes: {
        '/': (context) => LoginPage(),  // "/" denotes the page which is going to be displayed at top
        '/home': (context) => HomePage(),  // Navigate to HomePage via '/home'
        '/login': (context) => LoginPage(),  // LoginPage is initial screen
      },
=======
      home: HomePage(),
>>>>>>> 1b48be7ea24a1563cedbe4318c6feefe5d749a3b
    );
  }
}
