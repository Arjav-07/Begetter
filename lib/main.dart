import 'package:begetter/core/store.dart';
import 'package:begetter/pages/cart_page.dart';
import 'package:begetter/pages/home_page.dart';
import 'package:begetter/pages/login_page.dart';
import 'package:begetter/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:begetter/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light, // Dark theme as default
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: '/', // Now LoginPage is the default
      debugShowCheckedModeBanner: false, // Remove debug banner
      routes: {
        '/': (context) => HomePage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
