import 'package:begetter/widget/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int hour = 8;
  final String name = "Codepur";

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text("BEGETTER"),
      ),
      body: Center(
        child: Text(
          "Welcome to $hour hours of flutter video at $name",
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
