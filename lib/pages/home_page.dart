import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int hour = 8;
  final String name = "Codepur";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BEGETTER"),
      ),
      body: Center(
        child: Text(
          "Welcome to $hour hours of flutter video at $name",
        ),
      ),
      drawer: Drawer(),
    );
  }
}
