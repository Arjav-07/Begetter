import 'package:begetter/models/catalog.dart';
import 'package:begetter/widget/Item_widgets.dart';
import 'package:begetter/widget/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int hour = 8;
  final String name = "Codepur";

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("BEGETTER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            final item = dummyList[index]; // Use dummyList here
            return ItemWidget(item: item);
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
