import 'package:begetter/models/cart.dart';
import 'package:begetter/models/catalog.dart';
import 'package:begetter/pages/cart_page.dart';
import 'package:begetter/pages/home_page.dart';
import 'package:begetter/pages/login_page.dart';
import 'package:begetter/utils/routes.dart';
import 'package:begetter/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.HomeRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        '/': (context) => HomePage(),
      },
    );
  }
}
