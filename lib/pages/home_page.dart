import 'dart:convert';
import 'package:begetter/core/store.dart';
import 'package:begetter/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:begetter/models/catalog.dart';
import 'package:begetter/utils/routes.dart';
import 'package:begetter/widget/home_widgets/catalog_header.dart';
import 'package:begetter/widget/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      final response = await http.get(
        Uri.parse("https://api.jsonbin.io/v3/b/68667e818a456b7966baa949"),
      );

      if (response.statusCode == 200) {
        final catalogJson = response.body;
        final decodedData = jsonDecode(catalogJson);
        var productsData = decodedData["record"]["products"];
        CatalogModel.items = List.from(productsData)
            .map<Item>((item) => Item.fromMap(item))
            .toList();
        setState(() {});
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print("Error loading data: $e");
      // Optionally show a snackbar or error UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, __) {
          final _cart = (VxState.store as MyStore).cart;
          return FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: Theme.of(context)
                    .elevatedButtonTheme
                    .style
                    ?.backgroundColor
                    ?.resolve({}) ??
                Theme.of(context).colorScheme.primary,
            shape: const CircleBorder(),
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
            color: Vx.gray200,
            size: 20,
            count: _cart.totalItems,
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
